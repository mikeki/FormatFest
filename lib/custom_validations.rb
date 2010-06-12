#good post on how to do stuff like this  http://www.marklunds.com/articles/one/312

module ActiveRecord
  module Validations
    module ClassMethods

      # Use to check for this, that or those was entered... example:
      #  :validates_presence_of_at_least_one_field :last_name, :company_name  - would require either last_name or company_name to be filled in
      #  also works with arrays
      #  :validates_presence_of_at_least_one_field :email, [:name, :address, :city, :state] - would require email or a mailing type address
      def validates_presence_of_at_least_one_field(*attr_names)
        msg = attr_names.collect {|a| a.is_a?(Array) ? " ( #{a.join(", ")} ) " : a.to_s}.join(", ") +
                    "can't all be blank.  At least one field (set) must be filled in."
        configuration = {
          :on => :save,
          :message => msg }
        configuration.update(attr_names.extract_options!)

        send(validation_method(configuration[:on]), configuration) do |record|
          found = false
          attr_names.each do |a|
            a = [a] unless a.is_a?(Array)
            found = true
            a.each do |attr|
              value = record.respond_to?(attr.to_s) ? record.send(attr.to_s) : record[attr.to_s]
              found = !value.blank?
            end
            break if found
          end
          record.errors.add_to_base(configuration[:message]) unless found
        end
      end

    end
  end
end
