# Haru.Net.Mobile

Haru.Net.Mobile is a .NET wrapper for Haru FREE PDF Library, http://libharu.org.
Target frameworks: net451+, netstandard2.0 (including netcore). 

Resulting nuget package contains precompiled binaries for Android and iOS.

Author: Gehtsoft USA, LLC, git@gehtsoftusa.com

Version: 1.0, 6/20/2019

Contains altered 3rd party software:

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

License:
See LICENSE file.

