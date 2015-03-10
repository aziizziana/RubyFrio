require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/data.db")
class Participant
	include DataMapper::Resource
	property :id, Serial
	property :FirstName, String
	property :LastName, String
	property :PhoneNumber, String
	property :AlternatePhoneNumber, String
	property :Email, String
	property :HomeAddress, String
	property :EmergencyContactNumber, String
	property :Gender, String
end

DataMapper.finalize

Participant.auto_upgrade!

def getFemale(PhoneNumber)
	Participant.get(PhoneNumber).Gender
end

Participant.all(:PhoneNumber => 0782882227).each do |n|
	puts n.Gender
end
