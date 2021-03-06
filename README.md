# Home automation

## Installation
```shell
pip3 install david-home-automation==0.1.38
(sudo apt install --yes expect && cd $(mktemp -d) && git clone https://github.com/Heckie75/eQ-3-radiator-thermostat.git x && cd x && cp eq3.exp $HOME/.local/bin)

# (Optional) find your thermostat MACs via
bluetoothctl devices

# Create your config once 
cat > ~/.config/david-home-automation.yaml <<EOF
thermostats:
  - mac_address: XX:XX:XX:XX:XX:XX
    name: Arbeitszimmer
hosts:
  - broadcast_ip: 192.168.178.1
    mac_address: XX:XX:XX:XX:XX:XX
    name: Desktop
EOF

# You can also pass your config file path via an env variable
export HOME_AUTOMATION_CONFIG=your/path

python3 -m david_home_automation.server --server-host=0.0.0.0 --server-port 5000
```
### Setup as a service

```shell
./install.sh
```

### Setup eq3 bluetooth

Follow [the eq3.exp guide](https://github.com/Heckie75/eQ-3-radiator-thermostat#3-pair-bluetooth) for pairing your thermostats.
Make sure you do not connect/pair from multiple devices as the thermostats get easily confused.
If you are encountering strange connection issues or crypted error messages from the API (and by extension also `eq3.exp`), reset your thermostats to factory settings (see manual).
A useful debugging tool is `btmon`.

## Development

- [Install poetry](https://python-poetry.org/docs/#osx--linux--bashonwindows-install-instructions)

```
poetry install
FLASK_ENV=development FLASK_APP=david_home_automation/main poetry run flask run --host=0.0.0.0 --port 5050
```
