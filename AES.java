public class AES {

public static String encrypt(String key, String algorithm, String value) {
        try {
            SecretKey secretKey = new SecretKeySpec(Base64.decode(key.getBytes(), Base64.NO_WRAP), "AES");
            AlgorithmParameterSpec iv = new IvParameterSpec(Base64.decode(key.getBytes(), Base64.NO_WRAP));
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);

            return new String(Base64.encode(cipher.doFinal(value.getBytes("UTF-8")), Base64.NO_WRAP));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
  
  
  public static void main(String[] args) {
   //Usage:
    String key = "zjcSX3TumLzbJfpW\\/Zzung==";
    String padding = "AES/CBC/PKCS5Padding"; 
    String value = "anitaaiostest1"
    
    String encryptedString = encrypt(key,  padding, value);
    System.out.println(encryptedString)  // -> uKpbnE5XviQFU+dpWWD0oA==
  }
}
