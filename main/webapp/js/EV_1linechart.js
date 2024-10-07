
function drawlineChart() {
	var Bibliot = {
	  x: [0, 30, 60, 90, 120, 130, 160],
	  y: [100, 80, 60, 40, 20, 10, 0 ],
	  type: 'scatter',
	  name: '비블리엇',
	  mode: 'lines+markers',
	  line: {
          color: '#1ABC9C', // 선 색상
          width: 8 // 선 굵기 설정
      },
	};

	var T사 = {
	  x: [0, 30, 60, 90, 100, 110, 130],
	  y: [100, 80, 60, 40, 20, 10, 0 ],
	  type: 'scatter',
	  name: 'T사',
	  mode: 'lines+markers',
	  	  line: {
	            color: '#808080', // 선 색상
	            width: 8 // 선 굵기 설정
	        },
	};

	var data = [Bibliot, T사];
	
	var lineLayout = {
			title: { 
				text: 'Driving Distance', 
				font: {
					color: "#FFFFFF",
					}
					
				},
		        paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
		        plot_bgcolor: 'rgba(0, 0, 0, 0)', // 차트 내부 배경을 투명하게 설정
		        xaxis: {
					title: '거리 (Km)',
		            zeroline: true,
		            zerolinecolor: '#FFFFFF', // X축 제로라인 색상 흰색
		            gridcolor: '#FFFFFF', // X축 그리드 색상 흰색
					titlefont: { color: '#FFFFFF' }, // X축 제목 글자 색상 흰색
					tickfont: { color: '#FFFFFF', size:20 }, // X축 눈금 글자 색상 흰색
		        },
		        yaxis: {
					title: "배터리 충전량 (%)",
		            zeroline: true,
		            zerolinecolor: '#FFFFFF', // Y축 제로라인 색상 흰색
		            gridcolor: '#FFFFFF', // Y축 그리드 색상 흰색
					titlefont: { color: '#FFFFFF' }, // X축 제목 글자 색상 흰색
					tickfont: { color: '#FFFFFF', size:20}, // X축 눈금 글자 색상 흰색
		        },
				paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
				legend: {
				           font: {
				               color: '#FFFFFF' // 범례 텍스트 색상
				           }
				},
		 
		    };

	Plotly.newPlot('right-under-line', data,  lineLayout);

}