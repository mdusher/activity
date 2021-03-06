@api
Feature: List activity
  As a user I want to be able to see the activity list
  So that I know what is happening with my files/folders

  Scenario: file deletion should be listed in the activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes file "textfile0.txt" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/textfile0.txt$/   |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\.d\d+&view=trashbin\" id=\"\d+\">textfile0\.txt<\/file>$/ |

  Scenario: file restore should be listed in the activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted file "textfile0.txt"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the file with original path "textfile0.txt" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/   |
      | user             | /^user0$/           |
      | affecteduser     | /^user0$/           |
      | app              | /^files$/           |
      | subject          | /^restored_self$/   |
      | object_name      | /^\/textfile0.txt$/ |
      | object_type      | /^files$/           |
      | subject_prepared | /^You restored <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\" id=\"\d+\">textfile0\.txt<\/file>$/ |

  Scenario: folder deletion should be listed in the activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes folder "FOLDER" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/FOLDER$/          |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\.d\d+&view=trashbin\" id=\"\d+\">FOLDER<\/file>$/ |

  Scenario: folder restore should be listed in the activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted folder "FOLDER"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the folder with original path "FOLDER" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/ |
      | user             | /^user0$/         |
      | affecteduser     | /^user0$/         |
      | app              | /^files$/         |
      | subject          | /^restored_self$/ |
      | object_name      | /^\/FOLDER$/      |
      | object_type      | /^files$/         |
      | subject_prepared | /^You restored <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\" id=\"\d+\">FOLDER<\/file>$/ |

  Scenario: file inside folder deletion should be listed in the activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes file "PARENT/parent.txt" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/         |
      | user             | /^user0$/                |
      | affecteduser     | /^user0$/                |
      | app              | /^files$/                |
      | subject          | /^deleted_self$/         |
      | object_name      | /^\/PARENT\/parent.txt$/ |
      | object_type      | /^files$/                |
      | typeicon         | /^icon-delete-color$/    |
      | subject_prepared | /^You deleted <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=parent\.txt\.d\d+&view=trashbin\" id=\"\d+\">PARENT\/parent.txt<\/file>$/ |

  Scenario: file inside folder restore should be listed in the activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted file "PARENT/parent.txt"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the file with original path "PARENT/parent.txt" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/        |
      | user             | /^user0$/                |
      | affecteduser     | /^user0$/                |
      | app              | /^files$/                |
      | subject          | /^restored_self$/        |
      | object_name      | /^\/PARENT\/parent.txt$/ |
      | object_type      | /^files$/                |
      | subject_prepared | /^You restored <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT&scrollto=parent\.txt\" id=\"\d+\">PARENT\/parent\.txt<\/file>$/ |

  Scenario: sub folder deletion should be listed in the activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes folder "PARENT/CHILD" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/PARENT\/CHILD$/   |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/CHILD.d\d+&view=trashbin\" id=\"\d+\">PARENT\/CHILD<\/file>$/ |

  Scenario: sub folder restore should be listed in the activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted folder "PARENT/CHILD"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the folder with original path "PARENT/CHILD" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/   |
      | user             | /^user0$/           |
      | affecteduser     | /^user0$/           |
      | app              | /^files$/           |
      | subject          | /^restored_self$/   |
      | object_name      | /^\/PARENT\/CHILD$/ |
      | object_type      | /^files$/           |
      | subject_prepared | /^You restored <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT\/CHILD" id=\"\d+\">PARENT\/CHILD<\/file>$/ |

  Scenario: multiple file deletion should be listed in activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes file "textfile0.txt" using the WebDAV API
    And user "user0" deletes file "textfile1.txt" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/textfile1\.txt$/  |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile1\.txt\.d\d+&view=trashbin\" id=\"\d+\">textfile1\.txt<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\.d\d+&view=trashbin\" id=\"\d+\">textfile0\.txt<\/file><\/collection>$/ |

  Scenario: multiple folder deletion should be listed in activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes folder "PARENT" using the WebDAV API
    And user "user0" deletes folder "FOLDER" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/FOLDER$/          |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\.d\d+&view=trashbin\" id=\"\d+\">FOLDER<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT\.d\d+&view=trashbin\" id=\"\d+\">PARENT<\/file><\/collection>$/ |

  Scenario: multiple file restore should be listed in activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted file "textfile0.txt"
    And user "user0" has deleted file "textfile1.txt"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the file with original path "textfile0.txt" using the trashbin API
    And user "user0" restores the file with original path "textfile1.txt" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/    |
      | user             | /^user0$/            |
      | affecteduser     | /^user0$/            |
      | app              | /^files$/            |
      | subject          | /^restored_self$/    |
      | object_name      | /^\/textfile1\.txt$/ |
      | object_type      | /^files$/            |
      | subject_prepared | /^You restored <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile1\.txt\" id=\"\d+\">textfile1\.txt<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\" id=\"\d+\">textfile0\.txt<\/file><\/collection>$/ |

  Scenario: multiple folder restore should be listed in activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted folder "FOLDER"
    And user "user0" has deleted folder "PARENT"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the folder with original path "FOLDER" using the trashbin API
    And user "user0" restores the folder with original path "PARENT" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/ |
      | user             | /^user0$/         |
      | affecteduser     | /^user0$/         |
      | app              | /^files$/         |
      | subject          | /^restored_self$/ |
      | object_name      | /^\/PARENT$/      |
      | object_type      | /^files$/         |
      | subject_prepared | /^You restored <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT\" id=\"\d+\">PARENT<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\" id=\"\d+\">FOLDER<\/file><\/collection>$/ |

  Scenario: mix of folder and file deletion should be listed in activity list
    Given user "user0" has been created with default attributes
    When user "user0" deletes file "textfile0.txt" using the WebDAV API
    And user "user0" deletes folder "FOLDER" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_deleted$/      |
      | user             | /^user0$/             |
      | affecteduser     | /^user0$/             |
      | app              | /^files$/             |
      | subject          | /^deleted_self$/      |
      | object_name      | /^\/FOLDER$/          |
      | object_type      | /^files$/             |
      | typeicon         | /^icon-delete-color$/ |
      | subject_prepared | /^You deleted <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\.d\d+&view=trashbin\" id=\"\d+\">FOLDER<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\.d\d+&view=trashbin\" id=\"\d+\">textfile0\.txt<\/file><\/collection>$/ |

  Scenario: mix of folder and file restore should be listed in activity list
    Given user "user0" has been created with default attributes
    And user "user0" has deleted file "textfile0.txt"
    And user "user0" has deleted folder "FOLDER"
    And user "user0" has logged in to a web-style session
    When user "user0" restores the file with original path "textfile0.txt" using the trashbin API
    And user "user0" restores the folder with original path "FOLDER" using the trashbin API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_restored$/ |
      | user             | /^user0$/         |
      | affecteduser     | /^user0$/         |
      | app              | /^files$/         |
      | subject          | /^restored_self$/ |
      | object_name      | /^\/FOLDER$/      |
      | object_type      | /^files$/         |
      | subject_prepared | /^You restored <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/FOLDER\" id=\"\d+\">FOLDER<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0\.txt\" id=\"\d+\">textfile0\.txt<\/file><\/collection>$/ |

  Scenario: folder share should be listed in the activity list
    Given these users have been created with default attributes but not initialized:
      | username |
      | user0    |
      | user1    |
      | user2    |
    When user "user0" creates folder "/one" using the WebDAV API
    And user "user0" creates folder "/two" using the WebDAV API
    And user "user0" shares folder "/one" with user "user1" using the sharing API
    And user "user0" shares folder "/two" with user "user2" using the sharing API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^shared$/           |
      | user             | /^user0$/            |
      | affecteduser     | /^user0$/            |
      | app              | /^files_sharing$/    |
      | subject          | /^shared_user_self$/ |
      | object_name      | /^\/two$/            |
      | object_type      | /^files$/            |
      | typeicon         | /^icon-share$/       |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/two\" id=\"\d+\">two<\/file> with <user display-name=\"User Two\">user2<\/user>$/|
    And the activity number 2 of user "user0" should match these properties:
      | type             | /^shared$/           |
      | user             | /^user0$/            |
      | affecteduser     | /^user0$/            |
      | app              | /^files_sharing$/    |
      | subject          | /^shared_user_self$/ |
      | object_name      | /^\/one$/            |
      | object_type      | /^files$/            |
      | typeicon         | /^icon-share$/       |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/one\" id=\"\d+\">one<\/file> with <user display-name=\"User One\">user1<\/user>$/|

  Scenario: folder creation should be listed in the activity list
    Given user "user0" has been created with default attributes and without skeleton files
    When user "user0" creates folder "/one" using the WebDAV API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_created$/   |
      | user             | /^user0$/          |
      | affecteduser     | /^user0$/          |
      | app              | /^files$/          |
      | subject          | /^created_self$/   |
      | object_name      | /^\/one$/          |
      | object_type      | /^files$/          |
      | typeicon         | /^icon-add-color$/ |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^You created <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/one\" id=\"\d+\">one<\/file>/|

  Scenario: file upload should be listed in activity list
     Given user "user0" has been created with default attributes and without skeleton files
     When user "user0" uploads file "filesForUpload/textfile.txt" to "/text.txt" using the WebDAV API
     Then the activity number 1 of user "user0" should match these properties:
      | type             | /^file_created$/   |
      | user             | /^user0$/          |
      | affecteduser     | /^user0$/          |
      | app              | /^files$/          |
      | subject          | /^created_self$/   |
      | object_name      | /^\/text.txt$/     |
      | object_type      | /^files$/          |
      | typeicon         | /^icon-add-color$/ |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^You created <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=text.txt" id=\"\d+\">text.txt<\/file>/|

  Scenario: different files share with different user should be listed in activity list of sharer
    Given user "user0" has been created with default attributes
    And user "user1" has been created with default attributes and without skeleton files
    And user "user2" has been created with default attributes and without skeleton files
    When user "user0" shares file "PARENT/parent.txt" with user "user2" using the sharing API
    And user "user0" shares file "textfile0.txt" with user "user1" using the sharing API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^shared$/           |
      | user             | /^user0$/            |
      | affecteduser     | /^user0$/            |
      | app              | /^files_sharing$/    |
      | subject          | /^shared_user_self$/ |
      | object_name      | /^\/textfile0.txt$/  |
      | object_type      | /^files$/            |
      | typeicon         | /^icon-share$/       |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0.txt" id=\"\d+\">textfile0.txt<\/file> with <user display-name=\"User One\">user1<\/user>$/|
    And the activity number 2 of user "user0" should match these properties:
      | type             | /^shared$/               |
      | user             | /^user0$/                |
      | affecteduser     | /^user0$/                |
      | app              | /^files_sharing$/        |
      | subject          | /^shared_user_self$/     |
      | object_name      | /^\/PARENT\/parent.txt$/ |
      | object_type      | /^files$/                |
      | typeicon         | /^icon-share$/           |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT$/ |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT&scrollto=parent.txt" id=\"\d+\">PARENT\/parent.txt<\/file> with <user display-name=\"User Two\">user2<\/user>$/|

  Scenario: different files shared with same user should be listed in activity list of sharer
    Given user "user0" has been created with default attributes
    And user "user1" has been created with default attributes and without skeleton files
    When user "user0" shares file "PARENT/parent.txt" with user "user1" using the sharing API
    And user "user0" shares file "textfile0.txt" with user "user1" using the sharing API
    Then the activity number 1 of user "user0" should match these properties:
      | type             | /^shared$/           |
      | user             | /^user0$/            |
      | affecteduser     | /^user0$/            |
      | app              | /^files_sharing$/    |
      | subject          | /^shared_user_self$/ |
      | object_name      | /^\/textfile0.txt$/  |
      | object_type      | /^files$/            |
      | typeicon         | /^icon-share$/       |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0.txt" id=\"\d+\">textfile0.txt<\/file> with <user display-name=\"User One\">user1<\/user>$/|
    And the activity number 2 of user "user0" should match these properties:
      | type             | /^shared$/               |
      | user             | /^user0$/                |
      | affecteduser     | /^user0$/                |
      | app              | /^files_sharing$/        |
      | subject          | /^shared_user_self$/     |
      | object_name      | /^\/PARENT\/parent.txt$/ |
      | object_type      | /^files$/                |
      | typeicon         | /^icon-share$/           |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT$/ |
      | subject_prepared | /^You shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/PARENT&scrollto=parent.txt" id=\"\d+\">PARENT\/parent.txt<\/file> with <user display-name=\"User One\">user1<\/user>$/|

  Scenario: different files shared with different user should be listed in activity list of sharee
    Given user "user0" has been created with default attributes
    And user "user1" has been created with default attributes and without skeleton files
    And user "user2" has been created with default attributes and without skeleton files
    When user "user0" shares file "PARENT/parent.txt" with user "user1" using the sharing API
    And user "user0" shares file "textfile0.txt" with user "user2" using the sharing API
    Then the activity number 1 of user "user2" should match these properties:
      | type             | /^shared$/          |
      | user             | /^user0$/           |
      | affecteduser     | /^user2$/           |
      | app              | /^files_sharing$/   |
      | subject          | /^shared_with_by$/  |
      | object_name      | /^\/textfile0.txt$/ |
      | object_type      | /^files$/           |
      | typeicon         | /^icon-share$/      |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^<user display-name=\"User Zero\">user0<\/user> shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0.txt" id=\"\d+\">textfile0.txt<\/file> with you$/|
    And the activity number 1 of user "user1" should match these properties:
      | type             | /^shared$/         |
      | user             | /^user0$/          |
      | affecteduser     | /^user1$/          |
      | app              | /^files_sharing$/  |
      | subject          | /^shared_with_by$/ |
      | object_name      | /^\/parent.txt$/   |
      | object_type      | /^files$/          |
      | typeicon         | /^icon-share$/     |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^<user display-name=\"User Zero\">user0<\/user> shared <file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=parent.txt" id=\"\d+\">parent.txt<\/file> with you$/|

  Scenario: different files shared with same user should be listed in activity list of sharee
    Given user "user0" has been created with default attributes
    And user "user1" has been created with default attributes and without skeleton files
    When user "user0" shares file "PARENT/parent.txt" with user "user1" using the sharing API
    And user "user0" shares file "textfile0.txt" with user "user1" using the sharing API
    Then the activity number 1 of user "user1" should match these properties:
      | type             | /^shared$/          |
      | user             | /^user0$/           |
      | affecteduser     | /^user1$/           |
      | app              | /^files_sharing$/   |
      | subject          | /^shared_with_by$/  |
      | object_name      | /^\/textfile0.txt$/ |
      | object_type      | /^files$/           |
      | typeicon         | /^icon-share$/      |
      | link             | /^%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/$/ |
      | subject_prepared | /^<user display-name=\"User Zero\">user0<\/user> shared <collection><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=textfile0.txt" id=\"\d+\">textfile0.txt<\/file><file link=\"%base_url%\/(index\.php\/)?apps\/files\/\?dir=\/&scrollto=parent.txt" id=\"\d+\">parent.txt<\/file><\/collection> with you$/|
