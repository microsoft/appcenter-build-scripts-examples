# appcenter-post-build.sh
#
# For Xamarin, run all NUnit test projects that have "Test" in the name.
# The script will build, run and display the results in the build logs.

echo "Found NUnit test projects:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*Test.*\.csproj' -exec echo {} \;
echo
echo "Building NUnit test projects:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*Test.*\.csproj' -exec msbuild {} \;
echo
echo "Compiled projects to run NUnit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*Test.*\.dll' -exec echo {} \;
echo
echo "Running NUnit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*Test.*\.dll' -exec nunit3-console {} \;
echo
echo "NUnit tests result:"
find . -name 'TestResult.xml' -exec cat {} \;