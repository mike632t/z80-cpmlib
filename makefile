#
#  makefile
#
#	Copyright (C) 2012  MT
#	
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#	
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#	
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#	Note - Shell commands must start with a tab character at the beginning
#       of each line NOT spaces..!
#
#  25 Dec 20   0.1   - Initial  version - MT
#  26 Dec 20	0.2   - Just  backup  all the source files  in  the  current 
#                      folder! - MT
#  24 Jan 21   0.3   - Can now build more then one program - MT
#                    - Included  all macro source files and all the  object 
#                      files for the library modules in the backup - MT
#

PROGRAM		= cat echo hello list nop random sqrt type
LIBRARIES	= alloc bdos closef getc gets initf openf putc puti puts readf rndi sqrti writef
SOURCE		= $(PROGRAM:=.mac) $(LIBRARIES:=.mac)
OBJECT		= $(PROGRAM:=.rel) 
OUTPUT		= $(PROGRAM:=.out)
INCLUDE		= symbols
RUN			= ./cpm

FILES			= $(INCLUDE:=.mac) $(PROGRAM:=.mac) $(LIBRARIES:=.mac) #$(LIBRARIES:=.rel)
FILES			+= LICENSE makefile README.md

all: compile link clean

compile: $(SOURCE)
	@for file in $(SOURCE); do echo macro =$${file}/l; $(RUN) macro =$${file}/l; echo; done

link: $(OBJECT) 
	@for file in $(OBJECT); do echo link $${file}/n,$${file}/e; $(RUN) link $${file}/n,$${file}/e; echo; done
	
clean:
	@rm -f $(OBJECT)
	
backup:
	@tar -czvpf ../macro-`date +'%Y%m%d%H%M'`.tar.gz $(FILES)
