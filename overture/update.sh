ASSET_DIR="/etc/cleardns/asset"
[ -f "$ASSET_DIR/no_auto_update" ] && exit

TEMP_DIR="$ASSET_DIR/temp"
rm -rf "$TEMP_DIR" && mkdir -p "$TEMP_DIR"
wget -P "$TEMP_DIR" https://res.dnomd343.top/Share/gfwlist/gfwlist.txt
wget -P "$TEMP_DIR" https://res.dnomd343.top/Share/chinalist/chinalist.txt
wget -P "$TEMP_DIR" https://res.dnomd343.top/Share/chinalist/china_ip.txt

[ -s "$TEMP_DIR/gfwlist.txt" ] && mv -f "$TEMP_DIR/gfwlist.txt" "$ASSET_DIR"
[ -s "$TEMP_DIR/chinalist.txt" ] && mv -f "$TEMP_DIR/chinalist.txt" "$ASSET_DIR"
[ -s "$TEMP_DIR/china_ip.txt" ] && mv -f "$TEMP_DIR/china_ip.txt" "$ASSET_DIR"

rm -rf "$TEMP_DIR"
pgrep overture | xargs kill
