# Dedirectorizer

A very simple bash script used to copy the contents of a directory in a manner such that subdirectories are eliminated but the structure is preserved via the naming. Perhaps better understood via illustration

*Original Folder*
```bash
├── dir1
│   ├── file1
│   └── subdir1
│       └── file2
├── dir2
│   └── file2
├── file4
└── dir3
    └── subdir2
        ├── subsubdir1
        │   └──file6
        └── file5
```
is copied as

*dedirectorized Folder*
```bash
├── dir1.file1
├── dir1.subdir1.file2
├── dir2.file2
├── file4
├── dir3.subdir2.subsubdir1.file6
├── dir3.subdir2.file5
```

## Usage

There are two ways of utilizing this script. Both ways require you to download [dedirectorize.sh](./dedirectorize.sh) to your machine.

### Option 1 - Use within the folder
Place [dedirectorize.sh](./dedirectorize.sh) into the directory you wish to dedirectorize. Then in a terminal open in that specific directory, type
```bash
bash dedirectorize.sh
```
A directory named ```dedirectorized``` should appear containing the output described above.

### Option 2 - Use within any folder
You may wish to be able to call dedirectorize.sh from any directory without having to move [dedirectorize.sh](./dedirectorize.sh) to the desired directory each time. 
To achieve this, 

  1. create a directory called ```bin``` in your ```$HOME``` directory. ```mkdir -p $HOME/bin``` should be sufficient.
  2. Place [dedirectorize.sh](./dedirectorize.sh) in into it so that you have ```$HOME/bin/dedirectorize.sh```. 
  3. Depending on your system edit your ```.bashrc``` or ```.bash_profile``` file so to include the line ```export PATH="$HOME/bin:$PATH"```
  4. Make [dedirectorize.sh](./dedirectorize.sh) executable by entering ```chmod +x $HOME/bin/dedirectorize.sh``` into the terminal
  
You should now be able to write ```dedirectorize.sh``` into any terminal directory and succesfully run the script.

## Why?

For a certain university assignment, I was asked if I could share my project files on the university portal as I made progress throughout. On my machine, my project files were neatly organized in directories, subdirectories etc. The university portal fileshare system however did not support the creation of folders. As such I decided to embed my project directory structure into the filenames to make the organization clear on the portal despite the lack of folders. 

NB: I of course considered simply using a .zip file but opted not to as this would require me to re-upload my entire project each time I decided to update the university portal fileshare.

This is also truly my first custom bash script (so may be not that good/smart) as I wanted to learn/get better at this particular topic
