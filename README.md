What is this for?
-------------------------------------------------------------------------------------
Languages.xml contains all information about the languages available in MIUIAndroid multi-langauge ROMS.<br>
Languages.xml is used by <a href="https://github.com/Redmaner/MA-XML-CHECK" target="_blank">MA-XML-CHECK</a><br>

What information is used
-------------------------------------------------------------------------------------
- enabled: if yes MA-XML-CHECK will check this repository
- name: name of the language
- iso: ISO code of the language
- url: link to the repository on github/bitbucket
- git: ssh to the repository on github/bitbucket
- branch: branch used on github/bitbucket

Example
-------------------------------------------------------------------------------------
<i><enabled="yes" name="Dutch" iso="nl" url="https://github.com/Redmaner/MA-XML-5.0-DUTCH.git" git="git@github.com:Redmaner/MA-XML-5.0-DUTCH.git" branch="master"/></i><br>
Note: all information must be on one line!<br>
MA-XML-CHECK will pull languages.xml regulary so that languages can be added/disabled/enabled fast and easy.<br>
