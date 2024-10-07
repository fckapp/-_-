d3.csv("https://raw.githubusercontent.com/plotly/datasets/master/Mining-BTC-180.csv", function(err, rows) {
    if (err) {
        console.error(err);
        return;
    }

    function unpack(rows, key) {
        return rows.map(function(row) { return row[key]; });
    }

    // header values
    var headerNames = d3.keys(rows[0]);
    var headerValues = [headerNames[1], headerNames[2], headerNames[3], headerNames[4]];

    // cell values
    var cellValues = [];
    for (var i = 0; i < headerValues.length; i++) {
        var cellValue = unpack(rows, headerValues[i]);
        cellValues[i] = cellValue;
    }

    // clean date
    for (var i = 0; i < cellValues[0].length; i++) {
        var dateValue = cellValues[0][i].split(' ')[0];
        cellValues[0][i] = dateValue;
    }

    // create table
    var table = {
        type: 'table',
        columnwidth: [150, 200, 200, 150],
        columnorder: [0, 1, 2, 3],
        header: {
            values: headerValues,
            align: "center",
            line: { width: 1, color: 'rgb(50, 50, 50)' },
            fill: { color: ['#000000'] },
            font: { family: "Arial", size: 11, color: "white" }
        },
        cells: {
            values: cellValues,
            align: ["center", "center"],
            line: { color: "black", width: 1 },
            fill: { color: ['#FFFFFF', 'rgba(228, 222, 249, 0.65)'] },
            font: { family: "Arial", size: 10, color: ["black"] }
        },
        xaxis: 'x',
        yaxis: 'y',
        domain: { x: [0, 0.4], y: [0, 1] }
    };

    // create plots
    var trace1 = {
        x: unpack(rows, 'Date'),
        y: unpack(rows, 'Hash-rate'),
        xaxis: 'x1',
        yaxis: 'y1',
        mode: 'lines',
        line: { width: 2, color: '#D8D8D8' },
        name: '충전용량'
    };
    var trace2 = {
        x: unpack(rows, 'Date'),
        y: unpack(rows, 'Mining-revenue-USD'),
        xaxis: 'x2',
        yaxis: 'y2',
        mode: 'lines',
        line: { width: 2, color: '#FACC2E' },
        name: '가동시간'
    };
    var trace3 = {
        x: unpack(rows, 'Date'),
        y: unpack(rows, 'Transaction-fees-BTC'),
        xaxis: 'x3',
        yaxis: 'y3',
        mode: 'lines',
        line: { width: 2, color: '#FF0000' },
        name: '사용 전압'
    };

    var data = [table, trace1, trace2, trace3];

    // define subplot axes
    var axis = {
        showline: true,
        zeroline: false,
        showgrid: true,
        mirror: true,
        ticklen: 4,
        gridcolor: '#ffffff',
        linecolor: 'white', // 축 선 색상 흰색으로 설정
        tickfont: { size: 10, color: 'white' } // 눈금 글자 색상 흰색으로 설정
    };

    var axis1 = { domain: [0.5, 1], anchor: 'y1', showticklabels: false };
    var axis2 = { domain: [0.5, 1], anchor: 'y2', showticklabels: false };
    var axis3 = { domain: [0.5, 1], anchor: 'y3' };
    var axis4 = { domain: [0.66, 0.98], anchor: 'x1', hoverformat: '.2f' };
    var axis5 = { domain: [0.34, 0.64], anchor: 'x2', tickprefix: '$', hoverformat: '.2f' };
    var axis6 = { domain: [0.0, 0.32], anchor: 'x3', tickprefix: '\u20BF', hoverformat: '.2f' };

    // define layout
    var layout = {
		title: {
		            text: '비블리엇 태양전지 성능지표',
		            font: {
		                color: '#FFFFFF',
		            }
		        },
        plot_bgcolor: 'rgba(0, 0, 0, 0)', // 플롯 영역 배경을 투명하게 설정
        paper_bgcolor: 'rgba(0, 0, 0, 0)', // 전체 배경을 투명하게 설정
        showlegend: false,

        xaxis1: Object.assign(axis1, axis),
        xaxis2: Object.assign(axis2, axis),
        xaxis3: Object.assign(axis3, axis),
        yaxis1: Object.assign(axis4, axis),
        yaxis2: Object.assign(axis5, axis),
        yaxis3: Object.assign(axis6, axis)
    };

    Plotly.newPlot('right-under-hist', data, layout);

});