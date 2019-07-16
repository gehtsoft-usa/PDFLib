MY_PREFIX       := $(call my-dir)/../../src

##################################
#Haru
##################################
include $(CLEAR_VARS)

LOCAL_MODULE     := haru23

LOCAL_C_INCLUDES := \
    $(MY_PREFIX)/libharu/hpdf.h \
    $(MY_PREFIX)/libharu/hpdf_3dmeasure.h \
    $(MY_PREFIX)/libharu/hpdf_annotation.h \
    $(MY_PREFIX)/libharu/hpdf_catalog.h \
    $(MY_PREFIX)/libharu/hpdf_conf.h \
    $(MY_PREFIX)/libharu/hpdf_config.h \
    $(MY_PREFIX)/libharu/hpdf_consts.h \
    $(MY_PREFIX)/libharu/hpdf_destination.h \
    $(MY_PREFIX)/libharu/hpdf_doc.h \
    $(MY_PREFIX)/libharu/hpdf_encoder.h \
    $(MY_PREFIX)/libharu/hpdf_encrypt.h \
    $(MY_PREFIX)/libharu/hpdf_encryptdict.h \
    $(MY_PREFIX)/libharu/hpdf_error.h \
    $(MY_PREFIX)/libharu/hpdf_exdata.h \
    $(MY_PREFIX)/libharu/hpdf_ext_gstate.h \
    $(MY_PREFIX)/libharu/hpdf_font.h \
    $(MY_PREFIX)/libharu/hpdf_fontdef.h \
    $(MY_PREFIX)/libharu/hpdf_gstate.h \
    $(MY_PREFIX)/libharu/hpdf_image.h \
    $(MY_PREFIX)/libharu/hpdf_info.h \
    $(MY_PREFIX)/libharu/hpdf_list.h \
    $(MY_PREFIX)/libharu/hpdf_mmgr.h \
    $(MY_PREFIX)/libharu/hpdf_namedict.h \
    $(MY_PREFIX)/libharu/hpdf_objects.h \
    $(MY_PREFIX)/libharu/hpdf_outline.h \
    $(MY_PREFIX)/libharu/hpdf_page_label.h \
    $(MY_PREFIX)/libharu/hpdf_pages.h \
    $(MY_PREFIX)/libharu/hpdf_pdfa.h \
    $(MY_PREFIX)/libharu/hpdf_streams.h \
    $(MY_PREFIX)/libharu/hpdf_types.h \
    $(MY_PREFIX)/libharu/hpdf_u3d.h \
    $(MY_PREFIX)/libharu/hpdf_utils.h \
    $(MY_PREFIX)/libharu/hpdf_version.h \
    $(MY_PREFIX)/libharu/t4.h \
    $(MY_PREFIX)/pnglib/png.h \
    $(MY_PREFIX)/pnglib/pngconf.h \
    $(MY_PREFIX)/pnglib/pngdebug.h \
    $(MY_PREFIX)/pnglib/pnginfo.h \
    $(MY_PREFIX)/pnglib/pnglibconf.h \
    $(MY_PREFIX)/pnglib/pngpriv.h \
    $(MY_PREFIX)/pnglib/pngstruct.h \
    $(MY_PREFIX)/zlib/crc32.h \
    $(MY_PREFIX)/zlib/deflate.h \
    $(MY_PREFIX)/zlib/gzguts.h \
    $(MY_PREFIX)/zlib/inffast.h \
    $(MY_PREFIX)/zlib/inffixed.h \
    $(MY_PREFIX)/zlib/inflate.h \
    $(MY_PREFIX)/zlib/inftrees.h \
    $(MY_PREFIX)/zlib/trees.h \
    $(MY_PREFIX)/zlib/zconf.h \
    $(MY_PREFIX)/zlib/zlib.h \
    $(MY_PREFIX)/zlib/zutil.h 


ifneq (,$(filter x86 x86_64,$(TARGET_ARCH)))

LOCAL_SRC_FILES := \
    $(MY_PREFIX)/libharu/hpdf_3dmeasure.c \
    $(MY_PREFIX)/libharu/hpdf_annotation.c \
    $(MY_PREFIX)/libharu/hpdf_array.c \
    $(MY_PREFIX)/libharu/hpdf_binary.c \
    $(MY_PREFIX)/libharu/hpdf_boolean.c \
    $(MY_PREFIX)/libharu/hpdf_catalog.c \
    $(MY_PREFIX)/libharu/hpdf_destination.c \
    $(MY_PREFIX)/libharu/hpdf_dict.c \
    $(MY_PREFIX)/libharu/hpdf_doc.c \
    $(MY_PREFIX)/libharu/hpdf_doc_png.c \
    $(MY_PREFIX)/libharu/hpdf_encoder.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_cns.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_cnt.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_jp.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_kr.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_utf.c \
    $(MY_PREFIX)/libharu/hpdf_encrypt.c \
    $(MY_PREFIX)/libharu/hpdf_encryptdict.c \
    $(MY_PREFIX)/libharu/hpdf_error.c \
    $(MY_PREFIX)/libharu/hpdf_exdata.c \
    $(MY_PREFIX)/libharu/hpdf_ext_gstate.c \
    $(MY_PREFIX)/libharu/hpdf_font.c \
    $(MY_PREFIX)/libharu/hpdf_font_cid.c \
    $(MY_PREFIX)/libharu/hpdf_font_tt.c \
    $(MY_PREFIX)/libharu/hpdf_font_type1.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_base14.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cid.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cns.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cnt.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_jp.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_kr.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_tt.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_type1.c \
    $(MY_PREFIX)/libharu/hpdf_gstate.c \
    $(MY_PREFIX)/libharu/hpdf_image.c \
    $(MY_PREFIX)/libharu/hpdf_image_ccitt.c \
    $(MY_PREFIX)/libharu/hpdf_image_png.c \
    $(MY_PREFIX)/libharu/hpdf_info.c \
    $(MY_PREFIX)/libharu/hpdf_list.c \
    $(MY_PREFIX)/libharu/hpdf_mmgr.c \
    $(MY_PREFIX)/libharu/hpdf_name.c \
    $(MY_PREFIX)/libharu/hpdf_namedict.c \
    $(MY_PREFIX)/libharu/hpdf_null.c \
    $(MY_PREFIX)/libharu/hpdf_number.c \
    $(MY_PREFIX)/libharu/hpdf_objects.c \
    $(MY_PREFIX)/libharu/hpdf_outline.c \
    $(MY_PREFIX)/libharu/hpdf_page_label.c \
    $(MY_PREFIX)/libharu/hpdf_page_operator.c \
    $(MY_PREFIX)/libharu/hpdf_pages.c \
    $(MY_PREFIX)/libharu/hpdf_pdfa.c \
    $(MY_PREFIX)/libharu/hpdf_real.c \
    $(MY_PREFIX)/libharu/hpdf_streams.c \
    $(MY_PREFIX)/libharu/hpdf_string.c \
    $(MY_PREFIX)/libharu/hpdf_u3d.c \
    $(MY_PREFIX)/libharu/hpdf_utils.c \
    $(MY_PREFIX)/libharu/hpdf_xref.c \
    $(MY_PREFIX)/pnglib/png.c \
    $(MY_PREFIX)/pnglib/pngerror.c \
    $(MY_PREFIX)/pnglib/pngget.c \
    $(MY_PREFIX)/pnglib/pngmem.c \
    $(MY_PREFIX)/pnglib/pngpread.c \
    $(MY_PREFIX)/pnglib/pngread.c \
    $(MY_PREFIX)/pnglib/pngrio.c \
    $(MY_PREFIX)/pnglib/pngrtran.c \
    $(MY_PREFIX)/pnglib/pngrutil.c \
    $(MY_PREFIX)/pnglib/pngset.c \
    $(MY_PREFIX)/pnglib/pngtrans.c \
    $(MY_PREFIX)/pnglib/pngwio.c \
    $(MY_PREFIX)/pnglib/pngwrite.c \
    $(MY_PREFIX)/pnglib/pngwtran.c \
    $(MY_PREFIX)/pnglib/pngwutil.c \
    $(MY_PREFIX)/pnglib/intel/filter_sse2_intrinsics.c \
    $(MY_PREFIX)/pnglib/intel/intel_init.c \
    $(MY_PREFIX)/zlib/adler32.c \
    $(MY_PREFIX)/zlib/compress.c \
    $(MY_PREFIX)/zlib/crc32.c \
    $(MY_PREFIX)/zlib/deflate.c \
    $(MY_PREFIX)/zlib/gzclose.c \
    $(MY_PREFIX)/zlib/gzlib.c \
    $(MY_PREFIX)/zlib/gzread.c \
    $(MY_PREFIX)/zlib/gzwrite.c \
    $(MY_PREFIX)/zlib/infback.c \
    $(MY_PREFIX)/zlib/inffast.c \
    $(MY_PREFIX)/zlib/inflate.c \
    $(MY_PREFIX)/zlib/inftrees.c \
    $(MY_PREFIX)/zlib/trees.c \
    $(MY_PREFIX)/zlib/uncompr.c \
    $(MY_PREFIX)/zlib/zutil.c

else
 
LOCAL_SRC_FILES := \
    $(MY_PREFIX)/libharu/hpdf_3dmeasure.c \
    $(MY_PREFIX)/libharu/hpdf_annotation.c \
    $(MY_PREFIX)/libharu/hpdf_array.c \
    $(MY_PREFIX)/libharu/hpdf_binary.c \
    $(MY_PREFIX)/libharu/hpdf_boolean.c \
    $(MY_PREFIX)/libharu/hpdf_catalog.c \
    $(MY_PREFIX)/libharu/hpdf_destination.c \
    $(MY_PREFIX)/libharu/hpdf_dict.c \
    $(MY_PREFIX)/libharu/hpdf_doc.c \
    $(MY_PREFIX)/libharu/hpdf_doc_png.c \
    $(MY_PREFIX)/libharu/hpdf_encoder.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_cns.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_cnt.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_jp.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_kr.c \
    $(MY_PREFIX)/libharu/hpdf_encoder_utf.c \
    $(MY_PREFIX)/libharu/hpdf_encrypt.c \
    $(MY_PREFIX)/libharu/hpdf_encryptdict.c \
    $(MY_PREFIX)/libharu/hpdf_error.c \
    $(MY_PREFIX)/libharu/hpdf_exdata.c \
    $(MY_PREFIX)/libharu/hpdf_ext_gstate.c \
    $(MY_PREFIX)/libharu/hpdf_font.c \
    $(MY_PREFIX)/libharu/hpdf_font_cid.c \
    $(MY_PREFIX)/libharu/hpdf_font_tt.c \
    $(MY_PREFIX)/libharu/hpdf_font_type1.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_base14.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cid.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cns.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_cnt.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_jp.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_kr.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_tt.c \
    $(MY_PREFIX)/libharu/hpdf_fontdef_type1.c \
    $(MY_PREFIX)/libharu/hpdf_gstate.c \
    $(MY_PREFIX)/libharu/hpdf_image.c \
    $(MY_PREFIX)/libharu/hpdf_image_ccitt.c \
    $(MY_PREFIX)/libharu/hpdf_image_png.c \
    $(MY_PREFIX)/libharu/hpdf_info.c \
    $(MY_PREFIX)/libharu/hpdf_list.c \
    $(MY_PREFIX)/libharu/hpdf_mmgr.c \
    $(MY_PREFIX)/libharu/hpdf_name.c \
    $(MY_PREFIX)/libharu/hpdf_namedict.c \
    $(MY_PREFIX)/libharu/hpdf_null.c \
    $(MY_PREFIX)/libharu/hpdf_number.c \
    $(MY_PREFIX)/libharu/hpdf_objects.c \
    $(MY_PREFIX)/libharu/hpdf_outline.c \
    $(MY_PREFIX)/libharu/hpdf_page_label.c \
    $(MY_PREFIX)/libharu/hpdf_page_operator.c \
    $(MY_PREFIX)/libharu/hpdf_pages.c \
    $(MY_PREFIX)/libharu/hpdf_pdfa.c \
    $(MY_PREFIX)/libharu/hpdf_real.c \
    $(MY_PREFIX)/libharu/hpdf_streams.c \
    $(MY_PREFIX)/libharu/hpdf_string.c \
    $(MY_PREFIX)/libharu/hpdf_u3d.c \
    $(MY_PREFIX)/libharu/hpdf_utils.c \
    $(MY_PREFIX)/libharu/hpdf_xref.c \
    $(MY_PREFIX)/pnglib/png.c \
    $(MY_PREFIX)/pnglib/pngerror.c \
    $(MY_PREFIX)/pnglib/pngget.c \
    $(MY_PREFIX)/pnglib/pngmem.c \
    $(MY_PREFIX)/pnglib/pngpread.c \
    $(MY_PREFIX)/pnglib/pngread.c \
    $(MY_PREFIX)/pnglib/pngrio.c \
    $(MY_PREFIX)/pnglib/pngrtran.c \
    $(MY_PREFIX)/pnglib/pngrutil.c \
    $(MY_PREFIX)/pnglib/pngset.c \
    $(MY_PREFIX)/pnglib/pngtrans.c \
    $(MY_PREFIX)/pnglib/pngwio.c \
    $(MY_PREFIX)/pnglib/pngwrite.c \
    $(MY_PREFIX)/pnglib/pngwtran.c \
    $(MY_PREFIX)/pnglib/pngwutil.c \
    $(MY_PREFIX)/pnglib/arm/arm_init.c \
    $(MY_PREFIX)/pnglib/arm/filter_neon.S \
    $(MY_PREFIX)/pnglib/arm/filter_neon_intrinsics.c \
    $(MY_PREFIX)/pnglib/arm/palette_neon_intrinsics.c \
    $(MY_PREFIX)/zlib/adler32.c \
    $(MY_PREFIX)/zlib/compress.c \
    $(MY_PREFIX)/zlib/crc32.c \
    $(MY_PREFIX)/zlib/deflate.c \
    $(MY_PREFIX)/zlib/gzclose.c \
    $(MY_PREFIX)/zlib/gzlib.c \
    $(MY_PREFIX)/zlib/gzread.c \
    $(MY_PREFIX)/zlib/gzwrite.c \
    $(MY_PREFIX)/zlib/infback.c \
    $(MY_PREFIX)/zlib/inffast.c \
    $(MY_PREFIX)/zlib/inflate.c \
    $(MY_PREFIX)/zlib/inftrees.c \
    $(MY_PREFIX)/zlib/trees.c \
    $(MY_PREFIX)/zlib/uncompr.c \
    $(MY_PREFIX)/zlib/zutil.c

endif


include $(BUILD_SHARED_LIBRARY)