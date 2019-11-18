What is this for?
-------------------------------------------------------------------------------------
- Languages.xml - contains all information about the languages available in MIUIAndroid multi-language ROMS.<br>

- MIUIvX_untranslateable.xml - contains all strings that are untranslateable.<br>

- MIUIvX_auto_ignorelist.xml - contains all strings that should not be marked as untranslateable by auto search in MIUIX_value_catcher.<br>

XML's are used by <a href="https://github.com/Redmaner/MA-XML-CHECK" target="_blank">MA-XML-CHECK</a><br>

Languages.xml
-------------------------------------------------------------------------------------
- check: there are four options possible
- --> false = language will not be checked
- --> basic = basic check (syntax errors, doubles, apostrophe)
- --> normal = basic check + untranslateable strings
- --> full = normal check + array items
- name: name of the language
- iso: ISO code of the language
- url: link to the repository on github/bitbucket
- git: ssh to the repository on github/bitbucket
- branch: branch used on github/bitbucket

ignorelists
------------------------------------------------------------------------------------
- folder: there are multiple options
- --> all = all folders in repo
- --> main = only for main folder in repo
- --> devices = only for devices folder in repo
- --> [device] = only for specific device (e.g. aries)
- application: specific application (e.g. Browser.apk)
- file: specific file (e.g. strings.xml)
- name: specific name of the string
<br>
See the files for examples
