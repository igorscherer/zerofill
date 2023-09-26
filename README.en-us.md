# ZeroFill Script for up to 4 simultaneous HDDs

**WARNING: This script has irreversible results it will permanently delete all the data inside Hard disks. Make sure to backup all important data before proceeding. Use it with extreme caution**

This is a simple bash script that allows you to reset 4 hard drives (HDDs) simultaneously using the `dd` command and send their serials to a txt file in some selected location, in this case it is a mount point /IMAGENS/serials.txt , which can be changed as necessary. It is useful for data formatting tasks on hard drives.

## How to use

1. **Clone this repository to your local machine**:

   ```shell
   git clone https://github.com/igorscherer/zerofill.git
   
Navigate to the project directory:
cd zerofill

2. Run the script:
./zerofill.sh

Make sure to give scripts execute permissions if necessary using the chmod +x zerofill.sh command.
**Remember that the reset operation will erase all data on the selected hard drive.**

# Important notes
*So far the script only works with HDDs that are mounted as (SDA,SDB,SDC,SDD), and can work with other types by changing the script.*

Make sure to use this script carefully as it will erase all data on hard drives.
It is recommended to use it with PXE Boot to use a live OS booted from the lan.
This script can be used to automate the process of resetting hard drives, saving time when dealing with multiple drives simultaneously.
The script has the function of zeroing all HDDs simultaneously and automatically turning off the computer 1 minute after completion and 3 warning beeps, depending on whether the computer has speakers.

Make sure you have the necessary privileges to perform low-level operations on storage devices, such as the dd command.

## I am not responsible for misuse or loss of data that may be related to this script.
