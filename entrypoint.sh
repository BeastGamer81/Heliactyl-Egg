#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/index.js" ]]; then
  node index.js
else
  echo "index.js not found. Proceed to install Heliactyl? (Y/N)";
  read proceed;

  case "$proceed" in
    "Y"|"y")
        echo "Installing Heliactyl...";

        git clone https://gitlab.com/heliactyl/panel.git /home/container/panel
        mv /home/container/panel/** /home/container
        rm -rf /home/container/panel

        npm i

        echo "Heliactyl installed. Please open settings.json and follow the guide to fill out the details: https://docs.votion.dev/docs/Dashactyl/configuration";
        exit 0;
        ;;
    "N"|"n")
        exit 0;
        ;;
    *)
        exit 1;
        ;;
    esac
fi
