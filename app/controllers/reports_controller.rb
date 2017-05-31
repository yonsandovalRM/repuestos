class ReportsController < ApplicationController
  def index
  	@ventas_diarias = Sale.all.group_by{ |u| u.created_at.last_week }

  	@data = {
	  labels: ["Noviembre","Diciembre","Enero", "Febrero", "Marzo"],
	  datasets: [

	    {
	        label: "2015",
	        backgroundColor: "#f0f0f4",
	        borderColor: "#b3b5c6",
	        data: [34, 65, 52, 48, 50]
	    },
	    {
	        label: "2016",
	        backgroundColor: "#f0d7e0",
	        borderColor: "#bbd8fa",
	        data: [54, 89, 28, 48, 40]
	    },
	    {
	        label: "2017",
	        backgroundColor: "#bbd8fa",
	        borderColor: "#4bc0c0",
	        data: [64, 98, 48, 28, 90]
	    }
	  ]
	}
	@options = { 
		height: "200",
	}
	@data2 = {
	  labels: ["Noviembre","Diciembre","Enero", "Febrero", "Marzo"],
	  datasets: [

	    {
	        label: "2015",
	        backgroundColor: "#def5fb",
	        borderColor: "rgba(220,220,220,1)",
	        data: [34, 65, 52, 48, 50]
	    },
	    {
	        label: "2016",
	        backgroundColor: "#bbd8fa",
	        borderColor: "rgba(151,187,205,1)",
	        data: [54, 89, 28, 48, 40]
	    },
	    {
	        label: "2017",
	        backgroundColor: "#ffefc3",
	        borderColor: "rgba(151,187,205,1)",
	        data: [64, 98, 48, 28, 90]
	    }
	  ]
	}
	@options2 = { 
		height: "200",
	}

  end
end
