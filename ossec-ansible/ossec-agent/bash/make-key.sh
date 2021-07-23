mkdir -p /usr/local/src/ossec-ansible/ossec-agent/files/oscky
mkdir -p /usr/local/src/ossec-ansible/ossec-agent/files/temp
while IFS="" read -r p || [ -n "$p" ]
do
        echo $p | awk '{print $3}' > n
        touch /usr/local/src/ossec-ansible/ossec-agent/files/temp/$(cat n).oscky
        echo "I" > /usr/local/src/ossec-ansible/ossec-agent/files/temp/$(cat n).oscky
        echo $p | awk '{print $4}' >> /usr/local/src/ossec-ansible/ossec-agent/files/temp/$(cat n).oscky
        echo "y" >> /usr/local/src/ossec-ansible/ossec-agent/files/temp/$(cat n).oscky
done < /var/ossec/etc/client.keys
#cd /usr/local/src/ossec-ansible/ossec-agent/files/temp
#sudo tar cvf oscky.tar.gzi .
rm -rf n
