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
		}else if (cmd.equals("/shop.shop")){
			cmdIf = new ShopViewCommander();
		}else if (cmd.equals("/top.shop")){
			cmdIf = new TopViewCommander();
		}else if (cmd.equals("/hat.shop")){
			cmdIf = new HatViewCommander();
		}else if (cmd.equals("/pants.shop")){
			cmdIf = new PantsViewCommander();
		}else if (cmd.equals("/shoes.shop")){
			cmdIf = new ShoesViewCommander();
		}else if (cmd.equals("/acc.shop")){
			cmdIf = new AccViewCommander();
		}else if (cmd.equals("/cookieIni.shop")){
			cmdIf = new CookieIniCommander();
		}else if (cmd.equals("/cookieInit.shop")){
			cmdIf = new CookieIniCommander();
		}
		
		return cmdIf;
	}
}









