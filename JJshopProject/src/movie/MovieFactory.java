package movie;

public class MovieFactory {
	
	private MovieFactory(){}
	
	private static MovieFactory instance = new MovieFactory();
	
	public static MovieFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		CommandIf cmdIf = null;
		if (cmd.equals("/list.movie")){
			cmdIf = new MovieListCommander();
		}
		return cmdIf;
	}
}









