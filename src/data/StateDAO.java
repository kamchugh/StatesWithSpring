package data;

import java.util.List;

public interface StateDAO {
	public State getStateByName(String name);
	public State getStateByAbbreviation(String abbreviation);
	public void addState(State state);
	public State getStateById(int id);
	public List<State> getAllStates();
}
