package shop;

public class ShopFactory {
	
	private ShopFactory(){}
	
	private static ShopFactory instance = new ShopFactory();
	
	public static ShopFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		
		CommandIf cmdIf = null;
		if (cmd.equals("/shopMain.shop")){
			cmdIf = new ShopMainCommender();
		}else if (cmd.equals("/pdJoinView.shop")){
			cmdIf = new PdJoinViewCommander();
		}else if (cmd.equals("/pdJoin.shop")){
			cmdIf = new PdJoinCommander();
		}
		
		return cmdIf;
	}
}









