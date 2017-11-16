package com.vg.model;

public class TrainSearchResultModel {

	private Integer trainId;

	private String trainName;

	private String arrivalTime;

	private String departureTime;

	private int availSeatClass1;

	private int availSeatClass2;

	private int availSeatClass3;

	public Integer getTrainId() {
		return trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public int getAvailSeatClass1() {
		return availSeatClass1;
	}

	public void setAvailSeatClass1(int availSeatClass1) {
		this.availSeatClass1 = availSeatClass1;
	}

	public int getAvailSeatClass2() {
		return availSeatClass2;
	}

	public void setAvailSeatClass2(int availSeatClass2) {
		this.availSeatClass2 = availSeatClass2;
	}

	public int getAvailSeatClas3() {
		return availSeatClass3;
	}

	public void setAvailSeatClas3(int availSeatClass3) {
		this.availSeatClass3 = availSeatClass3;
	}

	@Override
	public String toString() {
		return "TrainSearchResultModel [trainId=" + trainId + ", trainName=" + trainName + ", arrivalTime="
				+ arrivalTime + ", departureTime=" + departureTime + ", availSeatClass1=" + availSeatClass1
				+ ", availSeatClass2=" + availSeatClass2 + ", availSeatClass3=" + availSeatClass3 + "]";
	}

}
