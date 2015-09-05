package edu.msu.isa.JDBC;



public class DateStore {
	private String NomStartDate;
	private String NomEndDate;
	private String VoteStartDate;
	private String VoteEndDate;
	private String ResultDate;
	
	
	public String getNomStartDate() {
		return NomStartDate;
	}
	public void setNomStartDate(String nomStartDate) {
		NomStartDate = nomStartDate;
	}
	public String getNomEndDate() {
		return NomEndDate;
	}
	public void setNomEndDate(String nomEndDate) {
		NomEndDate = nomEndDate;
	}
	public String getVoteStartDate() {
		return VoteStartDate;
	}
	public void setVoteStartDate(String voteStartDate) {
		VoteStartDate = voteStartDate;
	}
	public String getVoteEndDate() {
		return VoteEndDate;
	}
	public void setVoteEndDate(String voteEndDate) {
		VoteEndDate = voteEndDate;
	}
	public String getResultDate() {
		return ResultDate;
	}
	public void setResultDate(String resultDate) {
		ResultDate = resultDate;
	}

}
