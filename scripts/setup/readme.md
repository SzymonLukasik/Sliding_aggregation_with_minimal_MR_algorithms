## Configuration Details

The following configuration details are essential for setting up and using the Google Cloud Platform (GCP) environment for this project.

### Google Cloud Platform (GCP) Introduction

Google Cloud Platform (GCP) is a cloud platform that allows you to build, test, and deploy your solutions using Google’s reliable and scalable infrastructure. GCP runs on the same infrastructure that Google uses internally for its products such as Google Search and YouTube. Other similar cloud platforms include Amazon AWS and Microsoft Azure.

### Creating a GCP Account

1. To create a GCP account, visit [Google Cloud Console](https://console.cloud.google.com/welcome).

2. It's recommended to use your `@uw.edu.pl` or `@students.mimuw.edu.pl` email address to receive extra credits. Make sure to create a Google account with this email address if you haven't already.

3. After creating an account, create a new project within the `uw.edu.pl` organization. You should see a project page similar to the following:

### Default Instance Settings

4. Enable the compute engine by clicking the hamburger menu (☰) and selecting "Compute Engine."

5. Change the default region to Warsaw:
   - Click on the hamburger menu (☰) again, go to "Compute Engine," and select "Settings."
   - Choose "Warsaw/europe-central2-a" as the default region and save the settings.

6. Upload your SSH public key for authentication. You can follow [this tutorial](https://www.ssh.com/academy/ssh/keygen) to generate an SSH key pair if you haven't already. Be sure to save the inserted values.

7. Create a new pair of private-public keys on your local machine and add them to your GCP settings. You can use the following command to generate the keys:

<code>
echo "y \n" | ssh-keygen -q -t ed25519 -C "$USER" -f ~/id_pdd -N ""
</code>


### Creating Instances

8. To create instances, go to "Compute Engine" -> "VM Instances" and click on "(...)" -> "Create Instance."

9. Create four instances with the following names: `master`, `worker1`, `worker2`, and `driver`. Leave all the remaining settings as default.

### Cluster Setup

#### Master

10. To connect to instances, you can use either the External IPs of the instances visible on `Compute Engine -> VM Instances` or use Google Cloud's feature to open an SSH connection from the browser.

11. Execute the `scripts/master.sh` script on the master instance. Please paste the private key generated in the previous step into this script.

#### Workers

12. Execute the `scripts/workers.sh` script on all worker instances. Make sure to paste the private key into this script as well.

#### Back to Master

13. Format the namenode and start the distributed file system (DFS) when all workers are live:

<code>
hdfs namenode -format
start-dfs.sh
</code>


#### Driver

14. Execute the `scripts/driver.sh` script on the driver instance. Save the backend URL as it will be used later.

### Networking

15. Instances within a single project on Google Cloud are in a private network and can freely communicate with each other. Default firewall rules block every connection except the `ssh` port `22`. It is recommended to keep the cluster private.

16. To securely use the cluster, you can create a VPN connection or use built-in SSH features such as port tunneling and SOCKS5.

### Port Tunneling

17. You can use port tunneling to access services running on the cluster. For example, you can tunnel the Jupyter (Colab backend) port of the driver (8888) to your local machine.

### SOCKS5 Proxy

18. To start a SOCKS5 proxy, provide the `-D PORT` option when starting an SSH connection. You can then configure your web browser to use this proxy to access resources on the cluster.

### Changing Colab Backend

19. Before proceeding with code execution, change the backend of the Colab notebook on the driver instance to the link provided during initialization.

### Connecting with Spark

20. You can connect with Spark using the provided configuration.

## Conclusion

After completing your work, remember to perform the following steps:

1. On the master instance, stop Spark: `stop-all.sh`.
2. On the master instance, stop HDFS: `stop-dfs.sh`.
3. On the driver instance, kill Jupyter.
4. Turn off all instances to avoid incurring charges.

By following these configuration details, you can set up and use the Google Cloud Platform environment for your project.

