sudo sed -i 's/address/database-ecomap.cjc2siunmkts.us-east-2.rds.amazonaws.com/g' /home/ec2-user/EcoMap/ecomap/etc/_configvars.conf
sudo sed -i 's/portdb/3306/g' /home/ec2-user/EcoMap/ecomap/etc/_configvars.conf
sudo sed -i 's/dbname/ecomap_db/g' /home/ec2-user/EcoMap/ecomap/etc/_configvars.conf

