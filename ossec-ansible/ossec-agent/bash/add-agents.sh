while IFS="" read -r p || [ -n "$p" ]
do
        echo $p | awk '{print $1}' > n
        touch ./$(cat n).oscad
        echo "A" > ./$(cat n).oscad
        echo $p | awk '{print $2}' >> ./$(cat n).oscad
        echo $p | awk '{print $1}'  >> ./$(cat n).oscad
        echo "" >> ./$(cat n).oscad
        echo "y" >> ./$(cat n).oscad
        echo "q" >> ./$(cat n).oscad
        /var/ossec/bin/manage_agents < ./$(cat n).oscad
        rm -rf ./$(cat n).oscad
done < ../files/hosts-list
rm -rf n
