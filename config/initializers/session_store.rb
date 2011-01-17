# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_one_table_session',
  :secret      => 'fac54253c6b2ea7d8cc4adb77d217431ac55692c1b1e61f5c2b3e08ae57c3cb64ea5f1cac88ddac30978a10ebb74dae96528124d3dd1cb1a689ccd65c826e6cf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
