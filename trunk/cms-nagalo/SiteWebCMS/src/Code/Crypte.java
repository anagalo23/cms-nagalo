package Code;


public class Crypte{
    private String code;
 
    public Crypte(String code) {
		super();
		this.code = code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode(){
        return code;
    }
    
    public static  String encrypt(String password){
        String crypte="";
        for (int i=0; i<password.length();i++)  {
            int c=password.charAt(i)^48; 
            crypte=crypte+(char)c;
        }
        return crypte;
    }
    public static  String decrypt(String password){
        String aCrypter="";
        for (int i=0; i<password.length();i++)  {
            int c=password.charAt(i)^48; 
            aCrypter=aCrypter+(char)c;
        }
        return aCrypter;
    }
  /*  public void main(String[] args){
    	String mp="goyat";
    	String crypte=encryptP(mp);
    	System.out.println(crypte);
    	System.out.println(decryptP(crypte));
    	
    }*/
 
 
}