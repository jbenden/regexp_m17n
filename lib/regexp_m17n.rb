module RegexpM17N
  def self.non_empty?(str)
    str = str.encode('UTF-16BE') if ['SJIS-SoftBank', 'UTF8-SoftBank', 'stateless-ISO-2022-JP-KDDI', 'ISO-2022-JP-KDDI', 'SJIS-KDDI', 'UTF8-KDDI', 'SJIS-DoCoMo', 'UTF8-DoCoMo', 'UTF-32', 'UTF-16', 'Windows-1257', 'Windows-874', 'TIS-620', 'Windows-1255', 'Windows-1254', 'Windows-1253', 'Windows-1256', 'Windows-1250', 'Windows-1252', 'CP50221', 'CP50220', 'ISO-2022-JP', 'GB12345', 'GB2312', 'EUC-JP-2004', 'CP51932', 'eucJP-ms', 'stateless-ISO-2022-JP', 'CP951', 'CP950', 'IBM869', 'IBM866', 'IBM865', 'IBM863', 'IBM862', 'IBM861', 'IBM860', 'IBM857', 'CP855', 'IBM855', 'CP852', 'IBM852', 'CP850', 'IBM775', 'IBM737', 'IBM437', 'Windows-1251', 'Windows-31J', 'UTF-32LE', 'UTF-32BE', 'UTF-16LE', 'Shift_JIS', 'KOI8-U', 'KOI8-R', 'ISO-8859-16', 'ISO-8859-15', 'ISO-8859-14', 'ISO-8859-13', 'ISO-8859-11', 'ISO-8859-10', 'ISO-8859-9', 'ISO-8859-8', 'ISO-8859-7', 'ISO-8859-6', 'ISO-8859-5', 'ISO-8859-4', 'ISO-8859-3', 'ISO-8859-2', 'ISO-8859-1', 'GBK', 'GB18030', 'EUC-KR', 'EUC-JP', 'CP949', 'Big5-HKSCS', 'Big5', 'US-ASCII', 'UTF-8', 'ASCII-8BIT', 'Big5-UAO'].include?(str.encoding.to_s)
    encoding = str.encoding.to_s
    if ['Emacs-Mule', 'EUC-TW', 'IBM864', 'Windows-1258', 'GB1988', 'macCentEuro', 'macCroatian', 'macCyrillic', 'macGreek', 'macIceland', 'macRoman', 'macRomania', 'macThai', 'macTurkish', 'macUkraine', 'MacJapanese', 'UTF8-MAC'].include?(encoding)
        str = str.encode('UTF-8').encode('UTF-16BE')
        encoding = 'UTF-16BE'
    end
    str =~ get_regex('^.+$', 'UTF-16BE', 16)
  end

  def self.get_regex pattern, encoding='ASCII', options=0
      Regexp.new(pattern.encode(encoding),options)
  end
end
