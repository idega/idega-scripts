USERNAME='username';
PASSWORD='password';
HOSTNAME='1.2.3.4';
REMOTE_FILENAME='filename';

CONNECTION_LINE=$USERNAME':'$PASSWORD'@'$HOSTNAME;

echo "Getting $REMOTE_FILENAME from national registry"
lftp $CONNECTION_LINE -e "debug 10; set ftp:passive-mode off; set ftp:auto-passive-mode no; get $REMOTE_FILENAME; bye"
FILENAME='national-registry';
ASCII_FILE_PATH=$HOME/scripts/$REMOTE_FILENAME;
FILENAME_WITH_PATH=$HOME/tjodskra/$FILENAME'-UTF8';

echo "Converting ASCII file: "$ASCII_FILE_PATH" to UTF-8";
iconv --from-code=IBM871 --to-code=UTF-8 $ASCII_FILE_PATH > $FILENAME_WITH_PATH
echo "Moving to "$FILENAME_WITH_PATH;

echo "Removing ASCII file: "$ASCII_FILE_PATH;
rm $ASCII_FILE_PATH;

NEST_FOLDER=$HOME"/tjodskra/monthly/";
SELTJARNARNES_FOLDER=$HOME"/tjodskra/seltjarnarnes/";
KVARTA_FOLDER=$HOME"/tjodskra/kvarta/";

echo "Cleaning old registry file in:"$NEST_FOLDER;
rm -rf $NEST_FOLDER;
mkdir -p $NEST_FOLDER;

echo "Cleaning old registry file in:"$SELTJARNARNES_FOLDER;
rm -rf $SELTJARNARNES_FOLDER;
mkdir -p $SELTJARNARNES_FOLDER;

echo "Cleaning old registry file in:"$KVARTA_FOLDER;
rm -rf $KVARTA_FOLDER;
mkdir -p $KVARTA_FOLDER;

echo "Copying new registry files to nest and seltjarnarnes folders"
cp  $FILENAME_WITH_PATH $NEST_FOLDER;
cp  $FILENAME_WITH_PATH $SELTJARNARNES_FOLDER;
cp  $FILENAME_WITH_PATH $KVARTA_FOLDER;
