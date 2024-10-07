function drawSalesChart() {
    var trace1 = {
        x: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        y: [20, 14, 25, 16, 18, 22, 19, 15, 12, 16, 20, 25],
        type: 'bar',
        name: '비블리엇',
        marker: {
            color: '#1ABC9C',
        }
    };

    var trace2 = {
        x: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        y: [19, 14, 22, 14, 16, 19, 15, 14, 10, 12, 12, 16],
        type: 'bar',
        name: 'T사',
        marker: {
            color: '#D8D8D8',
        }
    };

    var data = [trace1, trace2];

    var layout = {
        title: {
            text: '2024 Sales Report',
            font: {
                color: '#FFFFFF',
            }
        },
        xaxis: {
            tickangle: -45,
            title: '월',
            titlefont: {
                color: '#FFFFFF' // x축 제목 색상
            },
            tickfont: {
                color: '#FFFFFF' // x축 눈금 색상
            }
        },
        yaxis: {
            title: '매출액',
            titlefont: {
                color: '#FFFFFF' // y축 제목 색상
            },
            tickfont: {
                color: '#FFFFFF' // y축 눈금 색상
            }
        },
		legend: {
		           font: {
		               color: '#FFFFFF' // 범례 텍스트 색상
		           },
				  },
        barmode: 'group',
        paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
        plot_bgcolor: 'rgba(0, 0, 0, 0)', // 플롯 영역 배경을 투명하게 설정
		
    };

    Plotly.newPlot('right-under-hist', data, layout);
}
