/**
 * OneSimpleTablePaging
 * - A small piece of JS code which does simple table pagination.
 *	 It is based on Ryan Zielke's tablePagination (http://neoalchemy.org/tablePagination.html)
 *   which is licensed under the MIT licenses: http://www.opensource.org/licenses/mit-license.php
 *   Button designs are based on Google+ Buttons in CSS design from Pixify
 *   (http://pixify.com/blog/use-google-plus-to-improve-your-ui/).
 *       The floating <thead> concept is copied from http://stackoverflow.com/a/4709775/1177328 and
 *   http://codepen.io/jgx/pen/wiIGc.
 *
 * @author Chun Lin (GCL Project)
 *
 *
 * @name oneSimpleTablePagination
 * @type jQuery
 * @param Object userConfigurations:
 *      rowsPerPage - Number - Used to determine the starting rows per page. Default: 10
 *      topNav - Boolean - Specifies the desire to have the navigation be a top nav bar. Default: false
 *      floatingHeader - Boolean - Specifies whether the <thead> of the table is a floating header or not. Default: false
 * 	rowException - Selector - A selector with which to filter by. Default: null
 *
 *
 * @requires jQuery v1.7.1 or above
 */

$.prototype.extend(
	{
		'oneSimpleTablePagination': function(userConfigurations) {
			var defaults = {
				rowsPerPage : 10,
				topNav : false,
				floatingHeader: false,
				rowException : null
			};
			defaults = $.extend(defaults, userConfigurations);
			
			return this.each(function() {
				var table = $(this)[0];
				
				var currPageId = '#tablePagination_currPage';
				
				var tblLocation = (defaults.topNav) ? "prev" : "next";
		
				var rowSelector = 'tbody tr';
				
				if(defaults.rowException) {
					rowSelector += ':not("tr'+defaults.rowException+'")';
				};
				
				var tableRows = $.makeArray($(rowSelector, table));
		  
				var totalPages = countNumberOfPages(tableRows.length);
				
				var currPageNumber = 1;		

				var tableOffset = $(this).offset().top;
				var $header = $(this).find('> thead').clone();
		  
				function hideOtherPages(pageNum) {
					var intRegex = /^\d+$/;
					if (!intRegex.test(pageNum) || pageNum < 1 || pageNum > totalPages)
						return;
					var startIndex = (pageNum - 1) * defaults.rowsPerPage;
					var endIndex = (startIndex + defaults.rowsPerPage - 1);
					$(tableRows).show();
					for (var i = 0; i < tableRows.length; i++) {
						if (i < startIndex || i > endIndex) {
							$(tableRows[i]).hide();
						}
					}
				}
		  
				function countNumberOfPages(numRows) {
					var preTotalPages = Math.round(numRows / defaults.rowsPerPage);
					var totalPages = (preTotalPages * defaults.rowsPerPage < numRows) ? preTotalPages + 1 : preTotalPages;
					return totalPages;
				}
		  
				function resetCurrentPage(currPageNum) {
					var intRegex = /^\d+$/;
					if (!intRegex.test(currPageNum) || currPageNum < 1 || currPageNum > totalPages)
						return;
					currPageNumber = currPageNum;
					hideOtherPages(currPageNumber);
					$(table)[tblLocation]().find(currPageId).val(currPageNumber);
				}
		  
				function createPaginationElements() {
					var paginationHTML = "";
					paginationHTML += "<div id='tablePagination' style='text-align: center; padding-top: 5px; padding-bottom: 5px;'>";
					paginationHTML += "<a id='tablePagination_firstPage' href='javascript:;' style='padding: 10px; padding-bottom: 0px;'><i style='font-size: 1.4em;' class='fa fa-angle-double-left'></i></a>";
					paginationHTML += "<a id='tablePagination_prevPage' href='javascript:;' style='padding: 10px; padding-bottom: 0px;'><i style='font-size: 1.4em;' class='fa fa-angle-left'></i></a>";
					paginationHTML += "Page";
					paginationHTML += "<input id='tablePagination_currPage' type='input' value='" + currPageNumber + "' size='1'>";
					paginationHTML += "of " + totalPages + "&nbsp;&nbsp;&nbsp;";
					paginationHTML += "<a id='tablePagination_nextPage' href='javascript:;' style='padding: 10px; padding-bottom: 0px;'><i style='font-size: 1.4em;' class='fa fa-angle-right'></i></a>";
					paginationHTML += "<a id='tablePagination_lastPage' href='javascript:;' style='padding: 10px; padding-bottom: 0px;'><i style='font-size: 1.4em;' class='fa fa-angle-double-right'></i></a>";
					paginationHTML += "</div>";
					return paginationHTML;
				}			

				$(this).before("<style type='text/css'>a.button {color: #023042;font: bold 12px Helvetica, Arial, sans-serif;text-decoration: none;padding: 7px 12px;position: relative;display: inline-block;text-shadow: 0 1px 0 #fff;-webkit-transition: border-color .218s;-moz-transition: border .218s;-o-transition: border-color .218s;transition: border-color .218s;background: #99CCFF;background: -webkit-gradient(linear,0% 40%,0% 70%,from(#38C1F9),to(#C6EDFD));background: -moz-linear-gradient(linear,0% 40%,0% 70%,from(#38C1F9),to(#C6EDFD));border: solid 1px #023042;border-radius: 2px;-webkit-border-radius: 2px;-moz-border-radius: 2px;margin-right: 10px;}a.button:hover {color: #247FCA;border-color: #247FCA;-moz-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.2) -webkit-box-shadow:0 2px 5px rgba(0, 0, 0, 0.2);box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);}a.button:active {color: #000;border-color: #444;}a.left {-webkit-border-top-right-radius: 0;-moz-border-radius-topright: 0;border-top-right-radius: 0;-webkit-border-bottom-right-radius: 0;-moz-border-radius-bottomright: 0;border-bottom-right-radius: 0;margin: 0;}a.right:hover { border-left: solid 1px #999 }a.right {-webkit-border-top-left-radius: 0;-moz-border-radius-topleft: 0;border-top-left-radius: 0;-webkit-border-bottom-left-radius: 0;-moz-border-radius-bottomleft: 0;border-bottom-left-radius: 0;border-left: solid 1px #f3f3f3;border-left: solid 1px rgba(255, 255, 255, 0);}</style>");
				
				var bottomOfTableMarker = defaults.floatingHeader ? "<span id='bottom-of-table'></span>" : "";
				if (defaults.topNav) {
					$(this).before(createPaginationElements());
					$(this).after(bottomOfTableMarker);
				} else {
					$(this).after(createPaginationElements() + bottomOfTableMarker);
				}					
				
				var originalTableStyle = $(this).attr("style");
				originalTableStyle = originalTableStyle.replace(/position[^;]+;?/g, '');
				originalTableStyle = originalTableStyle.replace(/top[^;]+;?/g, '');
				originalTableStyle = originalTableStyle.replace(/display[^;]+;?/g, '');
				
				hideOtherPages(currPageNumber);
				
				$(table)[tblLocation]().find('#tablePagination_firstPage').click(function (e) {
					resetCurrentPage(1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_prevPage').click(function (e) {
					resetCurrentPage(parseInt(currPageNumber) - 1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_nextPage').click(function (e) {
					resetCurrentPage(parseInt(currPageNumber) + 1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_lastPage').click(function (e) {
					resetCurrentPage(totalPages);
			  	});
		  
				$(table)[tblLocation]().find(currPageId).on('change', function (e) {
					resetCurrentPage(this.value);
				});

				if (defaults.floatingHeader) {
					$(this).before('<table id="header-fixed" style="position: fixed; top: 0px; display:none;' + originalTableStyle + '">' + $header.html() + '</table>');
					$(window).bind("scroll", function() {
    						var offset = $(this).scrollTop();
    						$fixedHeader = $('#header-fixed');
						$fixedHeader.width($('#sample-table').width());
						$fixedHeader.find('th').each(function(index) {
               						$(this).css("width",$('#sample-table').find('th').eq(index).outerWidth() + 'px');});
						var tableBottomOffset = $('#bottom-of-table').offset().top - $fixedHeader.height();
						
    						if (offset >= (tableOffset + $fixedHeader.height()) && $fixedHeader.is(':hidden') && offset < tableBottomOffset) {
        						$fixedHeader.show();
    						}
    						else if (offset < (tableOffset + $fixedHeader.height()) || offset >= tableBottomOffset) {
        						$fixedHeader.hide();
    						}
					});
				}
			})
		}
	})

