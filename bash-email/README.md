#### Bash Email - A simple script to notify AppCenter Build Success/Failure.

##### Pre-Requisites: 

* This is a bash script, and uses the mail component. This will work only for your Android and iOS builds.

* Ensure you exclude the Sender Email Address from your Mail Spam Filters, or it will go to the Junk/Spam Folder. The 'from' email looks like this, vsts <vsts@Mac-n.local> where n could be {1,2,3...} 
(You can also filter based on Subject)


##### How-To: 

* Modify the ORG, APP, TO_ADDRESS, SUBJECT, SUCCESS_BODY, FAILURE_BODY as required. 
* Add it as a [post-build script](https://docs.microsoft.com/en-us/appcenter/build/custom/scripts/#post-build) to your repository.
* Configure your AppCenter build(s) to ensure the Build Script is picked.
