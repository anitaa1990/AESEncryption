/* Using WebCrypto.swift. You can download it using this link:
 * https://github.com/etienne-martin/WebCrypto.swift
 */

public class AES {
  
    /* The key received from the backend: base64 encoded string 
     * Step 1: Convert the base64 encoded string & the value to be encrypted -> to Data value type
     * Step 2: Convert the base64 encoded string to a hex string -> base64KeyData.map { String(format: "%02x", $0) }.joined()
     * Step 3: Use Webcrypto.swift to encrypt the value 
     * The algorithm used by WebCrypto.swift is the cipher-block chaining (CBC) mode. For key generation, it uses PKCS7 as the padding method.
     */
     func encryptValue(_ base64Key: String, _ value: String) {
        let base64KeyData = Data(base64Encoded: base64Key)!
        let hexKey = base64KeyData.map { String(format: "%02x", $0) }.joined()
        let valuedata = Data(value.utf8)
        let crypto = WebCrypto()
        crypto.encrypt(data: valuedata, key: hexKey, iv: hexKey, callback: {(encrypted: Data?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                print(encrypted!.base64EncodedString())
            }
        })
    } 
  
  
  /* Sample Implementation */
  let base64Key: String = "zjcSX3TumLzbJfpW\\/Zzung=="
  let value: String = "anitaaiostest1"
  encryptValue(base64Key, value) // -> uKpbnE5XviQFU+dpWWD0oA==
}