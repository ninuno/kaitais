meta:
  id: ninch_csdata
  file-extension: bin
  endian: be

seq:
  - id: header
    type: header
  - id: banners
    type: banner
    repeat: expr
    repeat-expr: banner.banner_count

types:
  header:
    seq:
      - id: unknown
        type: u2
      - id: version
        type: u1
      - id: unknown_region
        type: u1
        doc: 0 for v3, 0x39 for v4 JP
      - id: filesize
        type: u4
      - id: crc32
        type: u4
      - id: dl_list_id
        type: u4
      - id: country_code
        type: u4
      - id: language_code
        type: u4
        enum: language
      - id: supported_languages
        type: u1
        repeat: expr
        repeat-expr: 16
        enum: language
      - id: unknown1
        size: 12
      - id: dl_url_id
        type: str
        size: 256
        encoding: ascii
      - id: unknown2
        type: u2

  banner:
    seq:
      - id: title
        type: str
        size: 102
        encoding: utf-16be
      - id: picture_size
        type: u4
      - id: picture_offset
        type: u4
    instances:
      banner_count:
      value: unknown1[8]

enums:
  language:
    0: japanese
    1: english
    2: german
    3: french
    4: spanish
    5: italian
    6: dutch
    7: brazilian_portuguese
    0xff: unused