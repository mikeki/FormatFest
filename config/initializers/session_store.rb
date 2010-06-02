# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FormatFest_session',
  :secret      => '4919e021dead840aec3c91f7df02b373c6326a4ac216529dcb41f330cc0935164d772d69a743b1b1033296c3d376a0e63a10acdac4a48562cfc5444b9fb1ff3e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
