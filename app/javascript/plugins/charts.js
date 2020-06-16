  //CLASSES AVAILABLE FOR FURTHER CUSTOMISATION:
  //'graphBar'             - the bars
  //'spanChartLabel'       - data labels
  //'spanChartYAxisValue'  - Y axis values
  //'spanChartXAxisValue'  - X axis values
  //'spanChartYAxisTitle'  - X axis title
  //'spanChartXAxisTitle'  - Y axis title
  //'spanChartTitle'       - the chart title

  //Example use:
  //a = getSpanChart("Curve Graph", "graphValues", "graphLabels", "axisTitles");
  //a.init();
  //a.makeCurveChart();


if (document.querySelector('.model-performances')){
  testFunction();

  var a ;
  var b;
  var c;
  var d;
  function testFunction()
  {
    //A is a barchart, and uses default settings
    a = getSpanChart("Numbers by month", "graphValues", "graphLabels", "axisTitles");
    a.init();

    a.makeCurveChart();  //Bar Chart!

    //B is a donut chart, which is really a pie chart with an inner radius
    // b = getSpanChart("Donut Chart (B)", "graphValues", "graphLabels", "axisTitles");
    // b.bgBorderCol = '#000';
    // b.bgEndCol = '#ABA';
    // b.bgStartCol = '#ABA';
    // b.bottom = 630;
    // b.colorStart = '#72A745';
    // b.init();
    // b.innerRadius = 50;    //inner radius!
    // b.labelDistance = -25;
    // b.left = -100;
    // b.polar = false;
    // b.radius = 100;
    // b.titleColor = '#000';
    // b.totalWidth = 250;
    // b.makePieChart();      //Pie chart!

    //C is a pie chart, and has some custom features (set below)
    // c = getSpanChart("Pie Chart (C)", "graphValues", "graphLabels", "axisTitles");
    // c.init();
    // c.colorStart = '#7245A7';
    // c.radius = 100;
    // c.bottom = 630;
    // c.left = 200;
    // c.totalWidth = 250;
    // c.innerRadius = 0;
    // c.labelDistance = -25;
    // c.bgStartCol = '#B9B';
    // c.bgEndCol = '#B9B';
    // c.bgBorderCol = '#000';
    // c.titleColor = '#000';
    // c.makePieChart();  //Pie chart!


    //D is a polart chart, which is actually a pie chart but set polar=true
    // d = getSpanChart("Polar Area Chart (D)", "graphValues", "graphLabels", "axisTitles");
    // d.init();
    // d.colorStart = '#e67e22';
    // d.radius = 100;
    // d.bottom = 630;
    // d.left = 500;
    // d.totalWidth = 250;
    // d.innerRadius = 10;
    // d.labelDistance = 30;
    // d.bgStartCol = '#f39c12';
    // d.bgEndCol = '#f39c12';
    // d.bgBorderCol = '#000';
    // d.titleColor = '#FFF';
    // d.growOnEntry = true;
    // d.makePolarChart();        //Polar Chart!


  }


  function toolTip(x,y,hint)
  {
    $("#tooltip").remove();

    var gap = 15;

    var width = 100;
    var height= 50;
    var startCol = "#000";
    var endCol = "#333";

    $('body').append("<div id='tooltip' style='left:" + (x + gap) + "px; top:" + (y + gap) + "px; width: " + width +  "px; background: linear-gradient(to bottom, " + startCol + " 0%," + endCol + " 100%); color:#FFF;  border-style: solid; border-width: 1px; border-radius:10px; height:" + height + "px; position:fixed; vertical-align:middle; z-index:1002; text-align:center'><div style='position:relative; margin:auto auto; top:20%;'>" + hint + "</div></div>");

    $("#tooltip").mouseover("function(){$('#tooltip').remove();}");

  }


  function removeToolTip()
  {
    $('#tooltip').remove();
  }



  //THE FUNCTION
  function getSpanChart(title, id, labelID, axisTitleID)
  {
    var s =
        {
          //GENERAL PREFERENCES
          displayValues:true,     // display values
          hideSourceDataBool:true,    // Hide the elements you took the data from
          titleColor:'#FFF',      // Colour of the title
          ran: 1,


          //POSITIONING
          anchorObject:"",        // an object to anchor to
          totalHeight:200,        // height
          totalWidth:500,         // width
          bottom:370,             // Y offset
          left:200,               // X offset
          gap:10,                 // gap between bars


          //ANIMATION
          animate:true,           // animate the bar growth
          animationTime:800,      // time taken for animation of each
          delayBetweenGrowth:10,  // delay between bar growth starts
          totalAnimationTime:1000,


          //COLOURS
          colorStart:'#4572A7',
          barColorGradient:true,  // Each bar is slightly darker than the last
          barBorder:true,         // Should bars have borders
          barBorderColor:'#FFF',  //
          barTransparency:0.9,    //Bar Transparency!
          barWidth:0,


          //DATA LABELS
          labelYOffset:-20,       // Vertical offset for the label from the top of the bar
          labelXOffset:0,         // Horizontal offset for the label from center the bar
          labelWaitComplete:true, // Only animate in after all bars exist
          hintID:"graphLabels",   // hint text (e.g. in a pie chart)
          labelDistance:60,
          labelColor:'#FFF',

          //BACKGROUND
          showBackground:true,    // Show a background
          bgStartCol:'#2c3e50',
          bgEndCol:'#2c3e50',
          bgColor:'#3A3A3A',       // Background color for the charting area
          bgVPadding:100,         // Extra space around bars
          bgHPadding:130,         // As above
          bgBorderCol:'#FFF',


          //LINE CHART
          showDataLines:false,    //For bar charts, show lines
          showDataBars:true,      //For bar charts, show the bars
          showCurveLines:false,   //For bar charts, show curve lines
          shadeUnder:true,        //shading under curved lines

          //PIE CHART
          innerRadius:50,        //Inner radius
          radius:150,
          polar:false,
          growOnEntry:false,


          //AXIS
          showAxis:true,          // Show axis at all
          axisColor:'#FFF',       // Color of the axis
          axisLabels:true,        // Show axis values
          axisHPadding:30,        // Distance from the bars
          axisVPadding:1,         // Distance from the bars
          axisXSize:40,           // Height of X-Axis
          axisYSize:15,           // Width of Y-Axis
          axisFontColor:'#FFF',   // Font of the axis-data
          axisXturn90:false,      // Turn axis X labels by 90 degrees
          axisGrid:true,          // show horizontal lines for axis
          axisGridColor:'#888',   // color of the gridlines
          YAxisSkip:1,            // how many values to skip on Y axis
          YAxisLabelWidth:20,


          //shape objects
          shapes:new Array(),


          //init spanchart
          init: function()
          {
            s.ran = parseInt(Math.random()*500,0);                   // a random integer
            s.hideSourceData();
          },


          //destroy spanchart
          destroy: function()
          {
            $(".childOf"+s.ran).remove();
          },


          //hide the source data spanchart
          hideSourceData: function()
          {
            if (s.hideSourceDataBool)
            {
              $("#"+id).hide();
              $("#"+labelID).hide();
              $("#"+axisTitleID).hide();
            }
          },


          //get the data
          getData: function()
          {
            var values = $('#'+id).text().split(",");   // Get the values
            return values;
          },


          //get hints
          getHints: function()
          {
            var hints = $('#' + s.hintID).text().split(",");
            return hints;
          },


          //Get sum of array elements
          getArraySum: function(arr)
          {
            var total = 0;
            for (var i = 0; i < arr.length; i++)
            {
              total += parseFloat(arr[i],2);
            }
            return total;
          },


          //Get sum of array elements
          getArrayHighest: function(arr)
          {
            var highest= 0;
            for (var i = 0; i < arr.length; i++)
            {
              if (parseFloat(arr[i],2) > highest)
              { highest = arr[i];}

            }
            return highest;
          },


          //convert decimal to radians
          d2r: function(x)
          {
            return (x/360)*(2*Math.PI);
          },

          //convert radians to decimal
          r2d: function(x)
          {
            return (x/(2*Math.PI))*360;
          },


          addCanvas: function(y1, y2, x1, x2)
          {
            $("body").append("<canvas id='canvas" + s.ran + "' class='childOf" + s.ran + "' style='position:fixed; top:" + y2 + "px; left:" + x1 + "px;  ' height=" + (y2-y1) + "px width=" + (x2-x1) + "px></canvas>");
            $("#canvas" + s.ran).click(function(){s.graphClick();});

          },


          graphClick: function(event)
          {
            event = event || window.event;
            var x = event.clientX - s.left;
            var y = s.bottom - event.clientY;

            for (var i = 0; i < s.shapes.length; i++)
            {
              if (x >= s.shapes[i].startX && x <= (s.shapes[i].startX + s.barWidth) && y <= s.shapes[i].height)
              {
                alert(i);
              }
            }
          },




          graphHover: function(passedY, passedX)
          {

            var shapeFound = null;
            var hintToShow = "";

            for (var i = 0; i < s.shapes.length; i++)
            {
              var shape = s.shapes[i];

              //Square
              if (shape.square === true)
              {
                var x = passedX - s.left;
                var y = s.bottom - passedY;

                if (x >= shape.startX && x <= (shape.startX + s.barWidth)
                    && y <= shape.height)
                {
                  shapeFound = shape;
                  hintToShow = shape.hint;
                }
              }

              //Triangle (cone...pie)
              if (shape.tri === true)
              {
                var x = passedX - (s.left+s.totalWidth);
                var y = s.bottom - passedY;

                var plusX = Math.max(x,0-x);
                var plusY = Math.max(y,0-y);

                var hyp = Math.sqrt((plusX*plusX)+(plusY*plusY));

                if (hyp < shape.radius && hyp > shape.innerRadius)
                {

                  var a = 0;
                  if (x > 0 && y > 0)
                  {
                    //top right
                    a = 270 + s.r2d((Math.atan(x/y)));
                  }
                  if (x > 0 && y < 0)
                  {
                    //bottom right
                    a = s.r2d((Math.atan((0-y)/x)));
                  }
                  if (x < 0 && y < 0)
                  {
                    //bottom left
                    a = 90 + s.r2d((Math.atan((0-x)/(0-y))));
                  }
                  if (x < 0 && y > 0)
                  {
                    //bottom left
                    a = 180 + s.r2d((Math.atan(y/(0-x))));
                  }

                  if (a >= shape.angle && a <= shape.angle2)
                  {
                    shapeFound = shape;
                    hintToShow = a;
                  }
                }
              }
            }

            if (hintToShow != "")
            {
              toolTip(passedX,passedY, shapeFound.hint);
            }
            else
            {
              removeToolTip();
            }
          },





          //Add background chart area
          addChartArea: function(left, top, width, height)
          {
            if (s.showBackground)
            {
              $('body').append("<div class='spanChartChartArea childOf" + s.ran + "' id='spanChartChartArea'"+s.ran+"' style='left:" + (left) + "px; top:" + top + "px; width: " + width +  "px; z-index:-100; background: linear-gradient(to bottom, " + s.bgStartCol + " 0%," + s.bgEndCol + " 100%);  border-style: solid; border-width: 1px; border-color: " + s.bgBorderCol + "; border-radius:20px; height:" + height + "px; position:fixed;'></div>");
            }
          },


          //Calculate adjustment on colour
          colorDecrease: function(colorStart, totalDown, totalCt, ct, transparency)
          {
            var r = parseInt(s.colorStart.substring(1,3),16);
            var g = parseInt(s.colorStart.substring(3,5),16);
            var b = parseInt(s.colorStart.substring(5,7),16);

            r -= parseInt((totalDown/totalCt)*ct,0);
            g -= parseInt((totalDown/totalCt)*ct,0);
            b -= parseInt((totalDown/totalCt)*ct,0);

            return  "rgba(" + r + "," + g + "," + b + "," + transparency + ")";
          },

          addDiv: function(newID, newClass, ran, left, top, width, height, color, bgColor, innerText)
          {
            $('body').append("<div id='" + newID + "'; class='" + newClass + " childOf" + ran + "' style='left:" + left + "px; top:" + top + "px; color:" + color + "; background-color:" + bgColor + ";  width: " + width + "px; height: " + height + "px; position:fixed;  text-align:center;'>" + innerText + "</div>");

          },


          shapeTest: function()
          {
            alert(s.shapes.length);
          },

          addShape: function(shape)
          {
            var l = s.shapes.length;
            s.shapes[l] = shape;
          },

          makeShape: function()
          {
            var s =
                {
                  square:false,
                  startX:0,
                  startY:0,
                  width:0,
                  height:0,

                  tri:false,
                  angle:0,
                  angle2:0,
                  radius:0,
                  innerRadius:0,

                  hint:""
                };

            return s;
          },


          //////////////////////////////////////////////
          //Polar Chart
          //////////////////////////////////////////////
          // makePolarChart: function()
          // {
          //   s.polar = true;          // polar = true
          //   s.makePieChart();
          // },



          //////////////////////////////////////////////
          //Line Chart
          //////////////////////////////////////////////
          makeLineChart: function()
          {
            s.showDataLines = true;
            s.showDataBars = false;
            s.showCurveLines = false;
            s.makeBarChart();
          },



          //////////////////////////////////////////////
          //Curve Chart
          //////////////////////////////////////////////
          makeCurveChart: function()
          {
            s.showDataLines = false;
            s.showDataBars = false;
            s.showCurveLines = true;
            s.makeBarChart();
          },



          //////////////////////////////////////////////
          //Pie Chart
          //////////////////////////////////////////////

          ///////////////////////////////////
          //Make the pie chart
          ///////////////////////////////////
          // makePieChart: function()
          // {
          //   if (s.anchorObject != "")
          //   {
          //     s.bottom = $("#" + s.anchorObject).position().top + (s.totalWidth/2) + 30;

          //     s.left = $("#" + s.anchorObject).position().left - (s.totalWidth/2);
          //   }

          //   //Chart Area
          //   s.addChartArea((s.left+(s.totalWidth/2)), (s.bottom-(s.totalWidth/2)-30), s.totalWidth, s.totalWidth+30);

          //   //Title
          //   s.addDiv("chartIdTitle" + s.ran, "spanChartTitle", s.ran, (s.left + (s.totalWidth/2)), ((s.bottom - (s.totalHeight/2)) - 40), s.totalWidth , 0, s.titleColor, '#F00', title);

          //   //Canvas bits
          //   $("body").append("<canvas id='canvas" + s.ran + "' class='childOf" + s.ran + "' style='position:fixed; top:" + (s.bottom - (s.totalWidth/2)) + "px; left:" + (s.left+(s.totalWidth/2)) + "px;  ' height=" + s.totalWidth + "px width=" + s.totalWidth + "px></canvas>");


          //   $("body").append("<canvas id='canvas2" + s.ran + "' class='childOf" + s.ran + "' style='position:fixed; z-index:1001; background-color:transparent; top:" + (s.bottom - (s.totalWidth/2)) + "px; left:" + (s.left+(s.totalWidth/2)) + "px;  ' height=" + s.totalWidth + "px width=" + s.totalWidth + "px></canvas>");

          //   //$("#canvas2" + s.ran).mousemove(function(){s.graphHover(this,event);});

          //   $("#canvas2" + s.ran).mousemove(function() {var e=arguments[0] ; s.graphHover(e.pageY,e.pageX);});
          //   $("#canvas2" + s.ran).mouseout(function(){removeToolTip();});




          //   var canvas = document.getElementById('canvas' + s.ran);  // grab canvas element
          //   var ctx = canvas.getContext('2d');                       // 2d context of element
          //   s.ctx = ctx;

          //   s.callMakeSection( new Date().getTime(), canvas);        // recurring function (animation)
          //   //canvas.onClick = "alert('test');";


          // },

          //Animation function. Each call draws all the elements up to angle FC
          callMakeSection: function(startingTime, canvas)
          {
            s.ctx.clearRect(0, 0, canvas.width, canvas.height);               // clear canvas
            var values = s.getData();                                         // graph the data

            var timeDiff = (new Date().getTime() - startingTime) ;            // duration so far
            var fc = Math.min(360/(s.totalAnimationTime/timeDiff),360);       // big angle at this point

            var angleCum = 0;                                                 // start of next object

            s.shapes = new Array();
            for (var i = 0; i < values.length; i++)
            {
              var sec = s.makeSection(s.ctx, canvas);                         // New section
              sec.sAngle = angleCum;                                          // Start after last one
              sec.value = values[i];
              var ratio = 1;
              if (s.growOnEntry)
              {
                ratio = (fc/360);
              }
              if (s.polar)
              {
                angleCum += (fc / values.length);                             // increase angle sum
                sec.radius = ratio * ((s.radius - s.innerRadius)/ s.getArrayHighest(values)) * values[i];
              }
              else
              {
                angleCum += (fc / s.getArraySum(values)) * values[i];         // increase angle sum
                sec.radius = ratio * s.radius;
              }
              sec.tipColor = s.labelColor;
              sec.eAngle = angleCum ;                                         // set end angle
              sec.col1 = s.colorDecrease(s.colorStart, 40, values.length,i, s.barTransparency);  //
              sec.col2 = sec.col1;                                            // no inner gradient
              if (fc >= 360)
              {sec.tip = s.getHints()[i];}                                    // set tip
              sec.draw();                                                     // DRAW!
            }

            if (fc < 360)
            {
              //call back on yourself IF haven't had 360 degrees yet
              requestAnimationFrame(function(){s.callMakeSection(startingTime, canvas);});
            }

          },


          ///////////////////////////////////
          //Make a section of the pie chart
          ///////////////////////////////////
          // makeSection: function(ctx, canvas)
          // {
          //   var sec =
          //       {
          //         sAngle:0,

          //         eAngle:100,
          //         col1:"#000",
          //         col2:"#FFF",
          //         tip:"",
          //         tipColor:'#FFF',
          //         tipFont:'Verdana',
          //         tipSize:13,
          //         totalTime:1000,
          //         radius:50,
          //         value:0,

          //         ///////////////////////
          //         //Draw
          //         ///////////////////////
          //         draw: function()
          //         {
          //           //Maths
          //           var a = s.d2r(sec.sAngle + ((sec.eAngle - sec.sAngle) / 2));
          //           var halfWidth = s.totalWidth/2;
          //           var labelX = ((sec.radius + s.labelDistance) * Math.cos(a)) + halfWidth + s.left + halfWidth;
          //           var labelY = ((sec.radius + s.labelDistance) * Math.sin(a)) + halfWidth + s.bottom - halfWidth;
          //           var x2 = (s.radius * Math.cos(a)) + (s.totalWidth/2);
          //           var y2 = (sec.radius * Math.sin(a)) + (s.totalWidth/2);
          //           var innerX = (s.innerRadius * Math.cos(s.d2r(sec.eAngle))) + halfWidth;
          //           var innerY = (s.innerRadius * Math.sin(s.d2r(sec.eAngle))) + halfWidth;


          //           //shape management
          //           var shape = s.makeShape();
          //           shape.tri = true;
          //           shape.angle = sec.sAngle;
          //           shape.angle2 = sec.eAngle;
          //           shape.radius = sec.radius;
          //           shape.innerRadius = s.innerRadius;
          //           shape.hint = "'" + sec.tip + "': " + sec.value;
          //           s.addShape(shape);


          //           //Colouring
          //           ctx.beginPath();
          //           var grd = ctx.createLinearGradient(halfWidth, halfWidth, x2, y2);
          //           grd.addColorStop(0,sec.col1);
          //           grd.addColorStop(1,sec.col2);
          //           ctx.fillStyle = grd;
          //           ctx.lineWidth = 2;
          //           ctx.strokeStyle = s.barBorderColor;

          //           //Line drawing
          //           ctx.arc(halfWidth, halfWidth, sec.radius, s.d2r(sec.sAngle), s.d2r(sec.eAngle));
          //           ctx.lineTo(innerX,innerY);
          //           ctx.arc(halfWidth, halfWidth, s.innerRadius, s.d2r(sec.eAngle), s.d2r(sec.sAngle), true);
          //           ctx.closePath();
          //           ctx.stroke();
          //           ctx.fill();

          //           //Add Tips
          //           if (sec.tip !== "")
          //           {
          //             $("body").append("<div class='tooltip childOf" + s.ran + "' style='position:fixed; top:" + labelY + "px; left:" + labelX + "px; color:" + sec.tipColor + "; font-family:" + sec.tipFont + "; font-size:" + sec.tipSize + "px; text-align:center; width:100px; margin-left:-50px; margin-top:-5px; display:none'>" + sec.tip + "</div>");
          //             var gap = 15;

          //             if (s.labelDistance > 0)
          //             {
          //               var lineX = ((sec.radius + gap) * Math.cos(a)) + halfWidth;
          //               var lineY = ((sec.radius + gap) * Math.sin(a)) + halfWidth;
          //               var lineX2 = (((sec.radius + s.labelDistance) - gap) * Math.cos(a)) + halfWidth;
          //               var lineY2 = (((sec.radius + s.labelDistance) - gap) * Math.sin(a)) + halfWidth;
          //               ctx.beginPath();
          //               ctx.moveTo(lineX, lineY);
          //               ctx.lineTo(lineX2,lineY2);
          //               ctx.strokeStyle = s.tipColor;
          //               ctx.stroke();
          //             }

          //             $('.tooltip.childOf' + s.ran ).fadeIn('slow');
          //           }

          //         }};
          //   return sec;
          // },














          //////////////////////////////////////////////
          //Make Bar Chart
          //////////////////////////////////////////////

          makeBarChart: function()
          {
            var values = $('#'+id).text().split(",");                // Get the values
            var axisTitles = $('#'+ axisTitleID).text().split(",");  // Get the values
            var topValue = Math.max.apply(Math, values);             // Find the highest value
            s.hideSourceData();                                      //Hide the data


            if (s.anchorObject != "")
            {
              s.bottom = $("#" + s.anchorObject).position().top + s.totalHeight + (s.bgVPadding/2) ;

              s.left =  $("#" + s.anchorObject).position().left + (s.axisHPadding + s.axisYSize + s.bgHPadding)/2 ;

            }

            ///////////////////////
            //Add Chart Area
            ///////////////////////
            if (s.showBackground)
            {
              //take into account the axis padding and space
              s.bgHPadding += s.axisHPadding + s.axisYSize;
              s.bgVPadding += s.axisVPadding + s.axisXSize;

              var bgLeft = s.left - (s.bgHPadding/2);
              var bgTop = (s.bottom - s.totalHeight) - (s.bgVPadding/2);
              var bgWidth = s.totalWidth + s.bgHPadding;
              var bgHeight = s.totalHeight + s.bgVPadding;

              s.addChartArea(bgLeft, bgTop, bgWidth, bgHeight);
            }


            ///////////////////////
            // Title
            ///////////////////////
            s.addDiv("chartTitle" + s.ran, "spanChartTitle", s.ran, s.left, (s.bottom - s.totalHeight - 45), s.totalWidth, 0, s.titleColor, 'transparent', title);


            ///////////////////////
            // X-Axis
            ///////////////////////
            if (s.showAxis)
            {
              //Line
              s.addDiv("spanChartAxis" + s.ran, "spanChartAxis", s.ran, s.left, (s.bottom + s.axisVPadding), (s.totalWidth-s.gap) , "1", "#FFF", s.axisColor, "");

              //Values
              var xLabels = $('#'+labelID).text().split(",");          // Get the values
              for (var Xi = 0; Xi < xLabels.length; Xi++)
              {
                var orientation = "text-align:center;";
                var topVal = (s.bottom + s.axisVPadding + 10);
                if (s.axisXturn90)
                {
                  orientation = "text-align:left; transform: rotate(90deg);";
                  topVal += s.axisVPadding;
                }

                $('body').append("<div class='spanChartXAxisValue childOf" + s.ran + "' style='left:" + (s.left + Xi*(s.totalWidth/xLabels.length)) + "px; top:" + topVal + "px; color:" + s.axisFontColor + "; width: " + ((s.totalWidth/xLabels.length)) + "px;  z-index:100; position:fixed;" + orientation + "'>" + xLabels[Xi] + "</div>");

              }

              //Title
              $('body').append("<div class='spanChartXAxisTitle childOf" + s.ran + "' style='left:" + s.left + "px; top:" + (s.bottom + s.axisHPadding + 10)  + "px; text-align:center; vertical-align:center; font-weight:bold; color:" + s.axisFontColor + "; width: " + s.totalWidth + "px;  z-index:100; position:fixed;'>" + axisTitles[0] + "</div>");

            }


            ///////////////////////
            // Y-Axis
            ///////////////////////
            if (s.showAxis)
            {
              //Line
              $('body').append("<div class='spanChartAxis childOf" + s.ran + "' id='spanChartYAxis'+s.ran style='left:" + (s.left - s.axisHPadding) + "px; top:" + (s.bottom - s.totalHeight) + "px; width: 1px; z-index:100; background-color:" + s.axisColor + "; height:" + s.totalHeight + "px; position:fixed;'></div>");

              //Values
              for (var Yi = 0; Yi <= topValue; Yi += s.YAxisSkip)
              {
                $('body').append("<div class='spanChartYAxisValue childOf" + s.ran + "' style='left:" + (s.left - s.axisHPadding - s.YAxisLabelWidth) + "px; top:" + (s.bottom - 10 - (s.totalHeight/topValue)*Yi) + "px; color:" + s.axisFontColor + "; width: 1px; z-index:100; position:fixed;'>" + Yi + "</div>");

                if (s.axisGrid)
                {
                  $('body').append("<div class='spanChartGrid childOf" + s.ran + "' style='left:" + s.left + "px; top:" + (s.bottom - (s.totalHeight/topValue)*Yi)  + "px; height:1px; width:" + (s.totalWidth - s.gap) + "px; background-color:" + s.axisGridColor + "; position:fixed;'></div>");
                }
              }

              //Title
              $('body').append("<div id='yAxis" + s.ran + "' class='spanChartYAxisTitle childOf" + s.ran + "' style='left:" + (s.left - (s.totalHeight/2) - s.axisHPadding - s.YAxisLabelWidth - 20) + "px; top:" + (s.bottom-s.totalHeight)  + "px; height:20px; text-align:center; font-weight:bold; width:" + s.totalHeight + "px; color:" + s.axisFontColor + "; z-index:100; transform: rotate(90deg) translate(" + s.totalHeight/2 + "px, 0px); position:fixed;'>" + axisTitles[1] + "</div>");



            }


            //Canvas bits
            var padding = 5;
            $("body").append("<canvas id='canvas" + s.ran + "' class='childOf" + s.ran + "' style='position:fixed; top:" + ((s.bottom - ((s.totalHeight+padding))) ) + "px; left:" + (s.left) + "px; background:rgba(64,64,64,0.0); ' height=" + (s.totalHeight + padding) + "px width=" + s.totalWidth + "px></canvas>");


            //$("#canvas" + s.ran).click(function(){s.graphClick(event);});
            //$("#canvas" + s.ran).mousemove(function(){s.graphHover(this.event);});
            $("#canvas" + s.ran).mousemove(function() {var e=arguments[0] ; s.graphHover(e.pageY,e.pageX);});
            $("#canvas" + s.ran).mouseout(function(){removeToolTip();});

            //$("#canvas" + s.ran).click(function(){alert("test");});

            var canvas = document.getElementById('canvas' + s.ran);  // grab canvas element
            var ctx = canvas.getContext('2d');                       // 2d context of element

            s.animateBarsHTML5(ctx, canvas, s.totalHeight, padding, new Date().getTime());


            ///////////////////////
            //Data labels
            ///////////////////////
            values = $('#'+id).text().split(",");                    // Get the values
            var barWidth = ((s.totalWidth-5) / values.length) - s.gap;   // width of bars
            s.barWidth = barWidth;

            for (var i = 0; i < values.length; i++)
            {
              var val = values[i];
              var pxMult = s.totalHeight/topValue;                     // Pixel Multiplier
              var barHeight = (val * pxMult);
              var textToDisplay = "";

              var newID = "chartID" + i + s.ran;
              if (s.displayValues)
              {
                textToDisplay = val;
                var labelLeft = ((s.left + (i*barWidth) + (i*s.gap))+s.labelXOffset);
                var labelTop = ((s.bottom - barHeight) + s.labelYOffset);

                $('body').append("<div class='spanChartLabel childOf" + s.ran + "' id='label" + newID + "'+s.ran style='display:none; position:fixed; left:" + labelLeft + "px; top:" + labelTop + "px; width: " + barWidth +  "px; z-index:100; text-align:center;'>" + textToDisplay + "</div>");
              }

              var fadeInSpeed = 'slow';
              if (s.totalAnimationTime === 0)
              {
                fadeInSpeed = '0';
              }

              var functionCall2 = "$('#label" + newID + "').fadeIn('" + fadeInSpeed + "')";
              window.setTimeout(functionCall2, (s.totalAnimationTime)  );
            }


          },





          animateBarsHTML5: function(ctx, canvas, finalHeight, padding, startTime)
          {
            ctx.clearRect(0, 0, canvas.width, canvas.height);            // clear canvas
            var values = $('#'+id).text().split(",");                    // Get the values
            var xLabels = $('#'+labelID).text().split(",");          // Get the values
            var topValue = Math.max.apply(Math, values);                 // Find the highest value
            var barWidth = ((s.totalWidth-5) / values.length) - s.gap;   // width of bars



            //DRAW elements
            var timeDiff = ((new Date().getTime() - startTime)) ;
            var totalHeight = (finalHeight) * ((timeDiff)/(s.totalAnimationTime));

            totalHeight = Math.min(totalHeight, finalHeight);
            var pxMult = totalHeight/topValue;                     // Pixel Multiplier
            ctx.lineWidth = 2;
            ctx.strokeStyle = s.barBorderColor;
            ctx.strokeStyle = s.tipColor;



            ///////////////////////////////////////
            //Data bars
            ///////////////////////////////////////
            if (s.showDataBars)
            {
              //clear shapes made
              s.shapes = new Array();

              for (var i = 0; i < values.length; i++)
              {
                //Calculations for each bar
                var newID = "chartIDBar" + i + s.ran;
                var val = values[i];
                var barHeight = (val * pxMult);

                var x1 = 2 + ((barWidth + s.gap) * i);
                var x2 = 2 + x1 + barWidth;
                var y1 =  s.totalHeight + padding;
                var y2 = y1 - (barHeight);


                //Add to shapes array
                var newShape = s.makeShape();
                newShape.square = true;
                newShape.startX = x1;
                newShape.startY = y1;
                newShape.width = barWidth;
                newShape.height = barHeight;
                newShape.hint = xLabels[i] + ": " + val;
                s.addShape(newShape);


                //Draw in the canvas
                ctx.beginPath();
                ctx.moveTo(x1, y1);
                ctx.lineTo(x1, y2);
                ctx.lineTo(x2, y2);
                ctx.lineTo(x2, y1);
                var col1 = s.colorDecrease(s.colorStart, 40, values.length, i, s.barTransparency);
                var col2 = col1;
                var grd = ctx.createLinearGradient(x1, y1, x1, y2);
                grd.addColorStop(0,col1);
                grd.addColorStop(1,col2);
                ctx.fillStyle = grd;

                ctx.stroke();

                ctx.fill();

              }
            }




            ///////////////////////////////////////
            //Data Lines
            ///////////////////////////////////////
            if (s.showDataLines)
            {
              ctx.beginPath();
              ctx.moveTo((barWidth/2), (s.totalHeight + padding)  );

              for (var i = 0; i < values.length; i++)
              {

                var newID = "chartIDLine" + i + s.ran;
                var val = values[i];
                var barHeight = (val * pxMult);


                //LINES
                if (s.showDataLines)
                {

                  var starter = 1;
                  if (s.shadeUnder)
                  {
                    starter = 0;
                  }

                  if (i >= starter)
                  {
                    var y1 = (s.totalHeight + padding);
                    var x1 = (barWidth/2) + ((barWidth + s.gap) * (i));

                    if (i!==0)
                    {
                      y1 = (s.totalHeight + padding) - (values[i-1] * pxMult);
                      x1 = (barWidth/2) + ((barWidth + s.gap) * (i-1));
                    }

                    var x2 = (barWidth/2) + ((barWidth + s.gap) * i);
                    var y2 = (s.totalHeight + padding) - (barHeight);

                    var col1 = s.colorDecrease(s.colorStart, 40, values.length, i, s.barTransparency)
                    var col2 = col1;
                    var grd = ctx.createLinearGradient(x1, y1, x1, y2);
                    grd.addColorStop(0,col1);
                    grd.addColorStop(1,col2);
                    ctx.fillStyle = grd;
                    //ctx.beginPath();

                    if (!s.shadeUnder)
                    {
                      ctx.moveTo(x1, y1);
                    }
                    ctx.lineTo(x2, y2);

                    if (i === values.length - 1 && (s.shadeUnder))
                    {
                      ctx.lineTo(x2, (s.totalHeight + padding));
                    }

                    ctx.stroke();    //Draw the line
                  }
                }
              }

              if (s.shadeUnder)
              {
                var grd = ctx.createLinearGradient(0, 0, 0, s.totalHeight);
                grd.addColorStop(0,s.colorStart);
                grd.addColorStop(1,s.colorDecrease(s.colorStart, 60, values.length, values.length, s.barTransparency));
                ctx.fillStyle = grd;
                ctx.fill();
              }
            }


            ///////////////////////////////////////
            //Curve Lines
            ///////////////////////////////////////
            if (s.showCurveLines)
            {

              if (s.shadeUnder)
              {
                ctx.beginPath();
                ctx.moveTo((barWidth/2), (s.totalHeight + padding) );
                ctx.lineTo((barWidth/2), (s.totalHeight + padding) - (values[0] * pxMult));
                ctx.stroke();
              }

              for (var i = 0; i < values.length; i++)
              {
                var newID = "chartIDCurve" + i + s.ran;
                var val = values[i];
                var barHeight = (val * pxMult);

                if (!s.shadeUnder)
                {
                  ctx.beginPath();
                }

                if (i > 0)
                {
                  var y1 = (s.totalHeight + padding) - (values[i-1] * pxMult);
                  var x1 = (barWidth/2) + ((barWidth + s.gap) * (i-1));

                  var x2 = (barWidth/2) + ((barWidth + s.gap) * i);
                  var y2 = (s.totalHeight + padding) - (barHeight);



                  if (!s.shadeUnder)
                  {
                    ctx.moveTo(x1, y1);
                  }
                  ctx.bezierCurveTo(x2-(barWidth/2), y1, x2-(barWidth/2), y2, x2, y2);

                  if (i === values.length - 1 && (s.shadeUnder))
                  {
                    ctx.lineTo(x2, (s.totalHeight + padding));
                  }


                  ctx.stroke();
                }
              }

              if (s.shadeUnder)
              {
                ctx.closePath();
                var grd = ctx.createLinearGradient(0, 0, 0, s.totalHeight);
                grd.addColorStop(0,s.colorStart);
                grd.addColorStop(1,s.colorDecrease(s.colorStart, 60, values.length, values.length, s.barTransparency));
                ctx.fillStyle = grd;
                ctx.fill();
              }
            }





            if (totalHeight < finalHeight)
            {
              requestAnimationFrame(function(){s.animateBarsHTML5(ctx, canvas, finalHeight, padding, startTime);});           }
          }
        };
    return s;
  };
};
