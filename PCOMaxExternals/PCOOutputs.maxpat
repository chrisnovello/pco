{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 12.0, 44.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"defrect" : [ 12.0, 44.0, 640.0, 480.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-20",
					"presentation_rect" : [ 259.0, 415.0, 0.0, 0.0 ],
					"patching_rect" : [ 256.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Game Initialized (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-5",
					"presentation_rect" : [ 229.0, 415.0, 0.0, 0.0 ],
					"patching_rect" : [ 228.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Newest Ball's Y Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/GameInitialized",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-4",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 256.0, 350.0, 157.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/NewestBallY",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-3",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 228.0, 324.0, 142.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-18",
					"patching_rect" : [ 174.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Oldest Ball's Y Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-19",
					"patching_rect" : [ 201.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Newest Ball's X Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-17",
					"patching_rect" : [ 145.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Oldest Ball's X Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-16",
					"patching_rect" : [ 115.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Right Paddle Missed A Ball (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-15",
					"patching_rect" : [ 86.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Right Paddle Collided With A Ball (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hidden" : 1,
					"numoutlets" : 0,
					"id" : "obj-14",
					"patching_rect" : [ 57.0, 415.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Left Paddle Missed A Ball (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-13",
					"patching_rect" : [ 30.0, 414.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Left Paddle Collided With A Ball (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/OldestBallY",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-11",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 174.0, 273.0, 137.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/NewestBallX",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-12",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 200.0, 299.0, 142.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/OldestBallX",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-10",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 145.0, 244.0, 137.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/RightPaddleMissedABall",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-9",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 115.0, 219.0, 205.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/RightPaddleCollidedWithABall",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-8",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 86.0, 191.0, 235.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/LeftPaddleMissedABall",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-7",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 57.0, 163.0, 197.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /PCO/LeftPaddleCollidedWithABall",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-6",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 31.0, 133.0, 227.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Port Defaults to 8801\nOptional argument can change that",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"id" : "obj-2",
					"fontname" : "Arial",
					"patching_rect" : [ 403.0, 27.0, 154.0, 48.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 1",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-50",
					"outlettype" : [ "int" ],
					"fontname" : "Arial",
					"patching_rect" : [ 292.0, 47.0, 59.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "patcherargs 8801",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-49",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 292.0, 24.0, 104.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "port $1",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-48",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 292.0, 70.0, 48.0, 18.0 ],
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8801",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-1",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 292.0, 95.0, 99.0, 20.0 ],
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
