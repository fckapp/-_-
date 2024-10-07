/**
 * 
 */
function drawPieChart1() {
	var pipData = [{
		  values: [99.9, 0.1],
		  labels: ['양품', '불량품'],
		  domain: {column: 0},
		  name: '비블리엇 EV-1 배터리',
		  hoverinfo: 'label+percent+name',
		  hole: .4,
		  textinfo: "label+percent",
		  insidetextorientation: "radial",
		  type: 'pie',
		  textfont: {color: '#FFFFFF', size: 16},
	  },
		{
		  values: [96, 4],
		  labels: ['양품', '불량품'],
		  domain: {column: 1},
		  name: '타 경쟁사 EV 배터리 품질',
		  hoverinfo: 'label+percent+name',
		  hole: .4,
		  textinfo: "label+percent",
		  insidetextorientation: "radial",
		  type: 'pie',
		  textfont: {
		        color: '#FFFFFF',
				size: 14 // 글자 색상 흰색
		    }
		}];

	var pipLayout = {
			title: {
		        text: 'Defect Rate Comparison',
		        font: {
		            color: '#FFFFFF',
		            }
			},
		  annotations: [
		    {
	            font: {
	                size: 20,
	                color: '#FFFFFF' // 첫 번째 설명 텍스트 색상
	            },
	            showarrow: false,
	            text: '비블리엇 0.1%.', // 첫 번째 추가 텍스트
	            x: 0.15, // X축 위치 (가운데)
	            y: -0.2, // Y축 위치 (그래프 아래)
	            xref: 'paper',
	            yref: 'paper',
	            align: 'center'
	        },
	        {
	            font: {
	                size: 20,
	                color: '#FFFFFF' // 두 번째 설명 텍스트 색상
	            },
	            showarrow: false, 
				text: 'T사 4%.', // 두번쨰 추가 텍스트
	            x: 0.85, // X축 위치 (가운데)
	            y: -0.2, // Y축 위치 (그래프 아래)
	            xref: 'paper',
	            yref: 'paper',
	            align: 'center'
	        },
		  ],
		  paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
		  showlegend: false,
		  grid: {rows: 1, columns: 2},
		 piecolorway: ['#1ABC9C', '#34495E'] ,// 흰색과 검정색
		};

	// 각 그래프의 크기 조정
	pipData[0].domain = {column: 0, row: 0, x: [0, 0.6], y: [0, 1]}; // 첫 번째 그래프 크기 조정
	pipData[1].domain = {column: 1, row: 0, x: [0.6, 1], y: [0, 1]}; // 두 번째 그래프 크기 조정
	
	Plotly.newPlot('right-top-pip', pipData, pipLayout);
}
