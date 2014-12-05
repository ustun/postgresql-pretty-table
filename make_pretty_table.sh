#!/bin/bash

# brew install gnu-sed on OS X
# on Linux, replace gsed with sed

TARGET_NAME="${1%.html}_enhanced.html"

cat > ${TARGET_NAME} <<"EOF"
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" type="text/css" media="screen" />

<script>
$(document).ready(function(){
    $('table').DataTable();
});
</script>
<style>
body { margin: 20px auto 10px auto; width: 90%; font-family: sans-serif;}
</style>

EOF

cat $1 >> ${TARGET_NAME}
gsed -i '0,/<tr>/{s/<tr>/<thead><tr>/}' ${TARGET_NAME}
gsed -i '0,/<\/tr>/{s|</tr>|</tr></thead>|}' ${TARGET_NAME}
open -a Safari $TARGET_NAME
