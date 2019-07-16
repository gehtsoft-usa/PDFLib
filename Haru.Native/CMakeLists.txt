cmake_minimum_required(VERSION 2.8)
project(libharu23)

set(CMAKE_CXX_STANDARD 14)

include(./cmake/ucm.cmake)

ucm_set_runtime(STATIC)

if (MOBILE_CROSS MATCHES "YES")
    ucm_add_flags(CXX -fvisibility=default)
else()
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        ucm_add_flags(CXX -fvisibility=hide)
    endif()
endif()

if (MOBILE_CROSS MATCHES "YES")
    set (PLATFORM_SPEC_HEADERS
            src/pnglib/arm/arm_init.c
            src/pnglib/arm/filter_neon.S
            src/pnglib/arm/filter_neon_intrinsics.c)
else()

    set (PLATFORM_SPEC_HEADERS
 	    src/pnglib/intel/filter_sse2_intrinsics.c
            src/pnglib/intel/intel_init.c)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    ucm_add_flags(CXX /W3)
endif()

add_library(libharu23 SHARED src/libharu/hpdf.h
        src/libharu/hpdf_3dmeasure.c
        src/libharu/hpdf_3dmeasure.h
        src/libharu/hpdf_annotation.c
        src/libharu/hpdf_annotation.h
        src/libharu/hpdf_array.c
        src/libharu/hpdf_binary.c
        src/libharu/hpdf_boolean.c
        src/libharu/hpdf_catalog.c
        src/libharu/hpdf_catalog.h
        src/libharu/hpdf_conf.h
        src/libharu/hpdf_config.h
        src/libharu/hpdf_consts.h
        src/libharu/hpdf_destination.c
        src/libharu/hpdf_destination.h
        src/libharu/hpdf_dict.c
        src/libharu/hpdf_doc.c
        src/libharu/hpdf_doc.h
        src/libharu/hpdf_doc_png.c
        src/libharu/hpdf_encoder.c
        src/libharu/hpdf_encoder.h
        src/libharu/hpdf_encoder_cns.c
        src/libharu/hpdf_encoder_cnt.c
        src/libharu/hpdf_encoder_jp.c
        src/libharu/hpdf_encoder_kr.c
        src/libharu/hpdf_encoder_utf.c
        src/libharu/hpdf_encrypt.c
        src/libharu/hpdf_encrypt.h
        src/libharu/hpdf_encryptdict.c
        src/libharu/hpdf_encryptdict.h
        src/libharu/hpdf_error.c
        src/libharu/hpdf_error.h
        src/libharu/hpdf_exdata.c
        src/libharu/hpdf_exdata.h
        src/libharu/hpdf_ext_gstate.c
        src/libharu/hpdf_ext_gstate.h
        src/libharu/hpdf_font.c
        src/libharu/hpdf_font.h
        src/libharu/hpdf_font_cid.c
        src/libharu/hpdf_font_tt.c
        src/libharu/hpdf_font_type1.c
        src/libharu/hpdf_fontdef.c
        src/libharu/hpdf_fontdef.h
        src/libharu/hpdf_fontdef_base14.c
        src/libharu/hpdf_fontdef_cid.c
        src/libharu/hpdf_fontdef_cns.c
        src/libharu/hpdf_fontdef_cnt.c
        src/libharu/hpdf_fontdef_jp.c
        src/libharu/hpdf_fontdef_kr.c
        src/libharu/hpdf_fontdef_tt.c
        src/libharu/hpdf_fontdef_type1.c
        src/libharu/hpdf_gstate.c
        src/libharu/hpdf_gstate.h
        src/libharu/hpdf_image.c
        src/libharu/hpdf_image.h
        src/libharu/hpdf_image_ccitt.c
        src/libharu/hpdf_image_png.c
        src/libharu/hpdf_info.c
        src/libharu/hpdf_info.h
        src/libharu/hpdf_list.c
        src/libharu/hpdf_list.h
        src/libharu/hpdf_mmgr.c
        src/libharu/hpdf_mmgr.h
        src/libharu/hpdf_name.c
        src/libharu/hpdf_namedict.c
        src/libharu/hpdf_namedict.h
        src/libharu/hpdf_null.c
        src/libharu/hpdf_number.c
        src/libharu/hpdf_objects.c
        src/libharu/hpdf_objects.h
        src/libharu/hpdf_outline.c
        src/libharu/hpdf_outline.h
        src/libharu/hpdf_page_label.c
        src/libharu/hpdf_page_label.h
        src/libharu/hpdf_page_operator.c
        src/libharu/hpdf_pages.c
        src/libharu/hpdf_pages.h
        src/libharu/hpdf_pdfa.c
        src/libharu/hpdf_pdfa.h
        src/libharu/hpdf_real.c
        src/libharu/hpdf_streams.c
        src/libharu/hpdf_streams.h
        src/libharu/hpdf_string.c
        src/libharu/hpdf_types.h
        src/libharu/hpdf_u3d.c
        src/libharu/hpdf_u3d.h
        src/libharu/hpdf_utils.c
        src/libharu/hpdf_utils.h
        src/libharu/hpdf_version.h
        src/libharu/hpdf_xref.c
        src/libharu/t4.h
        src/pnglib/intel
        src/pnglib/png.c
        src/pnglib/png.h
        src/pnglib/pngconf.h
        src/pnglib/pngdebug.h
        src/pnglib/pngerror.c
        src/pnglib/pngget.c
        src/pnglib/pnginfo.h
        src/pnglib/pnglibconf.h
        src/pnglib/pngmem.c
        src/pnglib/pngpread.c
        src/pnglib/pngpriv.h
        src/pnglib/pngread.c
        src/pnglib/pngrio.c
        src/pnglib/pngrtran.c
        src/pnglib/pngrutil.c
        src/pnglib/pngset.c
        src/pnglib/pngstruct.h
        src/pnglib/pngtrans.c
        src/pnglib/pngwio.c
        src/pnglib/pngwrite.c
        src/pnglib/pngwtran.c
        src/pnglib/pngwutil.c
        src/zlib/adler32.c
        src/zlib/compress.c
        src/zlib/crc32.c
        src/zlib/crc32.h
        src/zlib/deflate.c
        src/zlib/deflate.h
        src/zlib/gzclose.c
        src/zlib/gzguts.h
        src/zlib/gzlib.c
        src/zlib/gzread.c
        src/zlib/gzwrite.c
        src/zlib/infback.c
        src/zlib/inffast.c
        src/zlib/inffast.h
        src/zlib/inffixed.h
        src/zlib/inflate.c
        src/zlib/inflate.h
        src/zlib/inftrees.c
        src/zlib/inftrees.h
        src/zlib/trees.c
        src/zlib/trees.h
        src/zlib/uncompr.c
        src/zlib/zconf.h
        src/zlib/zlib.h
        src/zlib/zutil.c
        src/zlib/zutil.h
	${PLATFORM_SPEC_HEADERS}
        )

set_target_properties(libharu23 PROPERTIES PREFIX "")
