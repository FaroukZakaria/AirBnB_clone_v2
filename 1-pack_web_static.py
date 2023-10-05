#!/usr/bin/python3
""" Generates tgz packs """
from fabric.api import local
from datetime import datetime
import os

def do_pack():
    """Generate a .tgz archive from the contents of the web_static folder."""
    try:
        # Create the versions folder if it doesn't exist
        local("mkdir -p versions")

        # Get the current date and time
        now = datetime.utcnow()

        # Format the date and time into a string
        date_str = now.strftime("%Y%m%d%H%M%S")

        # Set the archive name
        archive_name = "web_static_{}.tgz".format(date_str)

        # Create the archive using tar
        local("tar -cvzf versions/{} web_static".format(archive_name))

        # Return the path to the generated archive
        return os.path.join("versions", archive_name)

    except Exception as e:
        print("Error during archive generation:", str(e))
        return None
