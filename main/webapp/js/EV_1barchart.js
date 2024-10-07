function drawBarChart() {
    var barData = [
        {
			domain: { x: [0, 0.5], y: [0, 1] }, // 첫 번째 인디케이터의 위치 설정
            value: 100,
            title: { 
                text: "비블리엇 12h",
                font: { color: '#FFFFFF', size: 20, } // 제목 글자 색상 설정
            },
            type: "indicator",
            mode: "gauge+number",
            delta: { reference: 20 },
            gauge: { 
                axis: { 
                    range: [0, 100], // Y축 범위 설정
                    tickcolor: '#FFFFFF', // 축 눈금 색상 흰색
                    title: { font: { color: '#FFFFFF' } }, // 축 제목 색상 흰색
                    linecolor: '#FFFFFF' // Y축 선 색상 흰색
                },
                bar: { color: '#1ABC9C' }, // 바 색상 파란색으로 설정
                bgcolor: 'rgba(0, 0, 0, 0)' // 배경을 투명하게 설정
            },
            number: {
                font: { color: '#FFFFFF', size: 40 } // 숫자 색상 흰색으로 설정
            }
        },
        {
            domain: { x: [0.5, 1], y: [0, 1] }, // 두 번째 인디케이터의 위치 설정
            value: 78,
            title: { 
                text: "T사 12h",
                font: { color: '#FFFFFF', size: 20 } // 제목 글자 색상 설정
            },
            type: "indicator",
            mode: "gauge+number",
            delta: { reference: 20 },
            gauge: { 
                axis: { 
                    range: [0, 100], // Y축 범위 설정
                    tickcolor: '#FFFFFF', // 축 눈금 색상 흰색
                    title: { font: { color: '#FFFFFF' } }, // 축 제목 색상 흰색
                    linecolor: '#FFFFFF' // Y축 선 색상 흰색
                },
                bar: { color: '#808080' }, // 바 색상 파란색으로 설정
                bgcolor: 'rgba(0, 0, 0, 0)' // 배경을 투명하게 설정
            },
            number: {
                font: { color: '#FFFFFF', size: 40 } // 숫자 색상 흰색으로 설정
            }
        }
    ];

    var barLayout = {
        title: { 
            text: 'Full Charging Comparison', 
            font: { 
                color: '#FFFFFF', // 제목 글자 색상 설정
            }
        },
		paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
		annotations: [{
		            text: 'Bibliot EV_1 Fast Charge ',
		            font: { size: 25, color: '#FFFFFF' }, // 글자 색상 설정
		            showarrow: false,
		            xref: 'paper',
		            yref: 'paper',
		            x: 0.5, // x축 위치
		            y: -0.2, // y축 위치
		            align: 'center'
		        }],
    };

    Plotly.newPlot('right-top-bar', barData, barLayout);
}
