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


Participant.create(:FirstName => "Ziana", :LastName => "Aziiz", :PhoneNumber => "0782882227", 
:AlternatePhoneNumber => "0757882227", :Email => "aziizziana@gmail.com", :HomeAddress => "Bakuli",
:EmergencyContactNumber => "17849949", :Gender => "F")

Participant.create(:FirstName => "Kisitu", :LastName => "Augustine", :PhoneNumber => "0752123456",
	:AlternatePhoneNumber => "070000000", :Email => "kisituaugustine@gmail.com", :HomeAddress => "Ntinda",
	:EmergencyContactNumber => "3453567", :Gender => "M")

Participant.create(:FirstName => "Shakila", :LastName => "Aziiz", :PhoneNumber => "0772577720",
	:AlternatePhoneNumber => "070000000", :Email => "kisituaugustine@gmail.com", :HomeAddress => "Ntinda",
	:EmergencyContactNumber => "3453567", :Gender => "F")


def getMTN()
	participants = Participant.all(:Gender => "M", :PhoneNumber.like => '075%') | Participant.all(:Gender => "F", 
		:PhoneNumber.like => '077%')
	participants.each do |participant|
		puts participant.FirstName
	end
end

getMTN()


