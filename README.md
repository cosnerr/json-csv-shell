# json-csv-shell
A quick and dirty sample script for merging, combining, and exporting json to csv using zsh, jq, and basic linux commands.

## Summary
Install the latest version of jq using the brew command for Mac.  The following code blocks assume you have placed your 4 JSON input files into the same directory as the shell script.

1. Create a files variable to hold each of the 4 JSON source files.  The current assumption for this use case is that there is only one top-level key in each JSON file.


   ```bash
   files=(friends.json rejected_friend_requests.json removed_friends.json sent_friend_requests.json)
   ```

2. Write a quick for loop.  If you run this code and more than one file was created it could be due to the date sub shell being run at the end of an hour.  You can store the date sub shell command in a separate variable and call the variable by using expansion brackets instead of the sub shell command as the prefix of your output file name.


   ```bash
   for f in $files; do ./parse_json.sh $f name timestamp >> $(date '+%Y%m%d%H')_Facebook_Friends_List.txt; done
   ```

3. Review and run your shell script. The LinkedIn article tied to this code repo is located here: [LinkedIn Article](https://www.linkedin.com/pulse/build-your-technical-toolbox-ryan-cosner/)

4. The shell script expects the following JSON Values for columns:

    name | timestamp
    ---- | ---------

5. Although not explicitly added, the CSV formatted output file has the following assumed columns:

   id | filename | friendname | timestampconverted
   -- | -------- | ---------- | ------------------

6.  Please note that this example was only intended to be a quick and dirty shell script for a specific use case.  However, it can be used as an example to fulfill more complex use cases.
