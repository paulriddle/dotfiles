from distutils.sysconfig import get_python_inc
import platform
import os

flags = [
'-Wall',
'-W',
'-Werror',
'-x',
'c',
'-O0'
]

SOURCE_EXTENSIONS = [ '.c' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h' ]


def FindCorrespondingSourceFile( filename ):
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        return replacement_file
  return filename


def FlagsForFile( filename, **kwargs ):
  filename = FindCorrespondingSourceFile( filename )

  return {
    'flags': flags,
    'include_paths_relative_to_dir': DirectoryOfThisScript(),
    'override_filename': filename
  }

