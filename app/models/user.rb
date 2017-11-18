class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+\z/ }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    validates :available_time_start, format: {with: /\A\d\d:\d\d\z/ }
    validates :available_time_end, format: {with: /\A\d\d:\d\d\z/ }
    has_secure_password
    has_one :amenity_list

    # Geolocation (NOTE: must call save on the object to trigger the coordinate creation)
    geocoded_by :full_street_address   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
    
    def full_street_address
        self.home_street_address + " " + self.home_city + " " + self.home_state + " " + self.home_zip_code
    end

    after_initialize :set_defaults

    def set_defaults
        self.available_time_start ||= '00:00'
        self.available_time_end ||= '00:00'
        self.home_street_address ||= ''
        self.home_city ||= ''
        self.home_state ||= ''
        self.home_zip_code ||= ''
    end
    
    def available_time
        self.available_time_start + "-" + self.available_time_end
    end
end
