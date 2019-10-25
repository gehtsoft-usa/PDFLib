# Haru.Net

Haru.Net is a .NET wrapper for Haru FREE PDF Library, http://libharu.org.
Target frameworks: net451+, netstandard2.0 (including netcore). 

Resulting nuget package contains precompiled binaries for win32, win64, linux64 
(tested on CentOS 7 and Ununtu 18) and MacOS.

Version: 1.1, 8/26/2019

Contains altered 3rd party software. 

The changes are made by Gehtsoft USA LLC (git@gehtsoftusa.com)

.NET wrappers are made by Gehtsoft USA LLC (git@gehtsoftusa.com) 

* libharu 2.4.0dev, http://libharu.org
  * Copyright:
    * Copyright (C) 1999-2006 Takeshi Kanno
    * Copyright (C) 2007-2009 Antony Dovgal
  * Changes:
    * Fix compression of PNG image's transparency mask
    * Ability to build a dynamic library for Linux and MacOS using default developer tools

* libpng 1.6.37, http://www.libpng.org/pub/png/libpng.html
  * Copyright:
    * Copyright (c) 1995-2019 The PNG Reference Library Authors.
    * Copyright (c) 2018-2019 Cosmin Truta.
    * Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson.
    * Copyright (c) 1996-1997 Andreas Dilger.
    * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.

* zlib 1.2.11, https://zlib.net
  * Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
  * Changes:
    * Add iOS support

* C# wrapper for libharu
  * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
  * Changes:
    * Fixed definitions of external functions
    * Update HPdfDoc constructor - optionally specify callback function for error handling
    * New method HPdfDoc.SaveToStream - save PDF document to stream
    * Fix method HPdfDoc.AddPageLabel - now returns the result of the function HPDF_AddPageLabel
    * Fix method HPdfDoc.LoadRawImageFromMem - changed argument types according to original definition of the C function
    * Fix method HPdfPage.SetRGBStroke - now returns the result of the function HPDF_Page_SetRGBStroke

## Changes:
* Version: 1.1, 8/26/2019
  * Add the haru.net methods that supports encodings other than current ACP encoding
  * Add native builds bit_depth fix for win/linux/osx dlls
  * Add ability to deblurring image on android
  * Rebuild native binaries (android, ios, mingw and linux/macos static libs) 
  * Add x64 binary for android
  * Add arm libraries, add build scripts

* Version: 1.0, 6/20/2019
  * Initial release

## License

Haru is distributed under the ZLIB/LIBPNG License. Because ZLIB/LIBPNG License 
is one of the freest licenses, You can use Haru for various purposes.

The license of Haru is as follows.

Copyright (C) 1999-2006 Takeshi Kanno
Copyright (C) 2007-2009 Antony Dovgal

This software is provided 'as-is', without any express or implied warranty.

In no event will the authors be held liable for any damages arising from the 
use of this software.

Permission is granted to anyone to use this software for any purpose,including 
commercial applications, and to alter it and redistribute it freely, subject 
to the following restrictions:

 1. The origin of this software must not be misrepresented; you must not claim 
    that you wrote the original software. If you use this software in a 
    product, an acknowledgment in the product documentation would be 
    appreciated but is not required.
 2. Altered source versions must be plainly marked as such, and must not be 
    misrepresented as being the original software.
 3. This notice may not be removed or altered from any source distribution.


## Acknowledgment

1. Information-technology Promotion Agency(IPA)
   The development of Haru has been supported by Exploratory Software Project 
   of Information-technology Promotion Agency(IPA), Japan. 

2. All users of libHaru.
   We wish to thank all users of Haru.
   In particular, we thank Thomas Nimstad, LeslieM, Par Hogberg, adenelson, 
   Riccardo Cohen, sea_sbs, Andrew. 
   They gave me very useful advices.

3. Sourceforge.net
   We would like to thank sourceForge.net for project hosting.

4. Adobe Systems Inc.
   We thank Adobe Systems Inc. for publishing PDF specification.
