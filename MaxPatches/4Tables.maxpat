{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 38.0, 79.0, 1156.0, 687.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1056.0, 359.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 7.0, 55.0, 22.0 ],
					"style" : "",
					"text" : "size 128"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 357.5, 7.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "setlist 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 1,
							"revision" : 0,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 38.0, 79.0, 1363.0, 828.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"visible" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "preset",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "preset", "int", "preset", "int" ],
									"patching_rect" : [ 409.0, 38.0, 100.0, 40.0 ],
									"preset_data" : [ 										{
											"number" : 1,
											"data" : [ 5, "obj-13", "multislider", "recall_preset", 512, 256, "obj-13", "multislider", "recall_preset", 0, 1.0, 0.999147, 0.998293, 0.99744, 0.996586, 0.995733, 0.994879, 0.994026, 0.993172, 0.992319, 0.991465, 0.990612, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 0.970128, 0.969275, 0.968421, 0.967313, 0.966205, 0.965097, 0.963989, 0.962881, 0.961773, 0.960665, 0.959557, 0.958449, 0.957341, 0.956233, 0.955125, 0.954017, 0.952909, 0.951801, -0.736842, -0.736842, -0.736842, -0.736842, -0.736842, -0.736842, 0.944892, 0.944066, 0.94324, 0.942415, 0.941589, 0.940764, 0.939938, 0.939112, 0.938287, 0.937461, 0.936636, 0.93581, 0.934985, 0.934159, 0.933333, -0.410526, -0.410526, -0.410526, -0.410526, -0.410526, -0.410526, -0.414035, -0.414035, 0.926316, 0.924561, -0.161404, -0.161404, -0.161404, -0.161404, -0.161404, -0.161404, 0.249123, 0.249123, 0.249123, 0.249123, 0.245614, 0.242105, 0.242105, -0.044912, -0.053333, -0.061754, -0.070175, -0.077193, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, 0.631579, -0.127485, -0.122807, -0.118129, -0.11345, -0.108772, -0.104094, -0.740351, -0.692105, -0.64386, -0.595614, -0.547368, -0.499123, -0.450877, -0.402632, -0.354386, -0.305614, -0.256842, -0.20807, -0.159298, -0.110526, -0.061754, -0.012982, 0.035789, 0.084561, 0.133333, 0.168421, 0.203509, 0.238596, 0.273684, 0.308772, 0.34386, 0.378947, 0.414035, 0.449123, 0.484211, 0.519298, 0.554386, 0.589474, 0.624561, 0.665107, 0.705653, 0.746199, 0.786745, 0.82729, 0.867836, 0.908382, 0.948928, 0.989474, -0.333333, -0.316491, -0.299649, -0.282807, -0.265965, -0.249123, -0.226667, -0.204211, -0.181754, -0.159298, -0.136842, -0.110877, -0.084912, -0.058947, -0.032982, -0.007018, 0.004912, 0.016842, 0.028772, 0.040702, 0.052632, -0.161404, -0.150877, -0.136842, -0.126316, -0.115789, -0.101754, -0.087719, -0.073684, -0.042105, -0.031579, -0.024561, -0.014035, 0.010526, 0.021053, 0.027193, 0.033333, 0.039474, 0.045614, 0.051462, 0.05731, 0.063158, 0.077193, -0.101754, -0.094737, -0.070175, -0.05848, -0.046784, -0.035088, -0.024561, -0.007018, 0.003509, 0.014035, 0.024561, 0.031579, 0.042105, 0.003258, 0.007519, -0.007018, 0.001754, 0.017544, 0.024561, 0.031579, 0.035088, 0.042105, 0.05614, 0.059649, 0.066667, 0.044211, -0.014035, -0.014035, -0.014035, -0.012281, -0.010526, 256, "obj-13", "multislider", "recall_preset", 251, -0.007018, 0.007018, 0.003509, -0.003509, -0.014035, -0.014035, -0.010526, -0.00614, -0.001754, 0.002632, 0.007018, 0.007719, 0.008421, 0.009123, 0.009825, 0.0, 0.0, 0.0, 0.0, -0.003509, -0.003509, -0.003509, 0.0, 0.003509, 0.007018, 0.010526, 0.010526, 0.007018, 0.010526, 0.016374, 0.022222, 0.02807, 0.010526, 0.010526, 0.014035, 0.017544, 0.021053, 0.018713, 0.016374, 0.014035, 0.0, 0.003509, 0.007018, 0.010526, 0.010526, 0.010526, 0.010526, 0.010526, 0.010526, 0.007018, 0.007018, 0.007018, 0.003509, 0.002339, 0.00117, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.003509, -0.003509, -0.003509, -0.008772, -0.009649, -0.010526, -0.011696, -0.012865, -0.014035, -0.014035, -0.014035, -0.014035, -0.014035, -0.014035, -0.014035, -0.010526, 0.0, 0.010526, 0.018713, 0.026901, 0.035088, 0.042105, 0.049123, 0.05614, 0.060819, 0.065497, 0.070175, 0.073684, 0.077193, 0.080702, 0.084211, 0.087719, 0.088421, 0.089123, 0.089825, 0.090526, 0.091228, 0.09193, 0.092632, 0.093333, 0.094035, 0.094737, 0.094737, 0.094737, 0.094737, 0.094737, 0.094737, 0.585965, 0.094737, 0.094737, 0.092398, 0.090058, 0.087719, 0.075439, 0.063158, 0.050877, 0.038596, 0.028655, 0.018713, 0.008772, -0.00117, -0.011111, -0.021053, -0.024561, -0.02807, -0.031579, -0.035088, -0.038596, -0.042105, -0.873684, -0.049123, -0.950877, -0.051754, -0.050877, -0.05, -0.049123, -0.048246, -0.047368, -0.046491, -0.045614, -0.044737, -0.04386, -0.042982, -0.042105, -0.477193, -0.040351, -0.039474, -0.038596, -0.034131, -0.029665, -0.025199, -0.020734, -0.016268, -0.011802, -0.007337, -0.002871, 0.001595, 0.006061, 0.010526, 0.014992, 0.019458, 0.023923, 0.028389, 0.032855, 0.037321, 0.041786, 0.046252, 0.050718, 0.055183, 0.059649, 0.063158, 0.066667, 0.070175, 0.073684, 0.077193, 0.080702, 0.084211, 0.087719, 0.091228, 0.094737, 0.098246, 0.101754, 0.105263, 0.108772, 0.112281, 0.115789, 0.119298, 0.122807, 0.417544, 0.433333, 0.449123, 0.136842, 0.138012, 0.139181, 0.140351, 0.610526, 0.621053, 0.635088, -0.8, 0.11345, 0.107602, 0.063158, 0.2, 0.091729, 0.086717, -0.954386, 0.403509, 0.933333, 0.919298, 0.291228, 0.007018, -0.082456, -0.17193, -0.211696, -0.251462, -0.291228, 0.017544, 0.17193, 0.210526, 0.249123, 0.287719, 0.37193, -0.385965, -0.610526, -0.610526, -0.207018, -0.150877, 0.045614, 0.115789, 0.185965, 0.252632, 0.319298, 0.352632, 0.421053, -0.133333, -0.291228, -0.334503, -0.377778, 15, "obj-13", "multislider", "recall_preset", 502, -0.421053, -0.470175, -0.519298, -0.568421, -0.617544, -0.666667, -0.715789, -0.792982, -1.0, -1.0, 4, "obj-13", "multislider", "recall_preset" ]
										}
, 										{
											"number" : 2,
											"data" : [ 5, "obj-13", "multislider", "recall_preset", 512, 256, "obj-13", "multislider", "recall_preset", 0, 0.936842, 0.937452, 0.938063, 0.938673, 0.939283, 0.939893, 0.940503, 0.941114, 0.941724, 0.942334, 0.942944, 0.943555, 0.944165, 0.944775, 0.945385, 0.945995, 0.946606, 0.947216, 0.947826, 0.948436, 0.949047, 0.949657, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 0.919298, 0.919298, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.259649, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, 0.915789, -0.049123, -0.073684, -0.087719, -0.101754, -0.128947, -0.15614, -0.183333, -0.210526, -0.253801, -0.297076, -0.340351, -0.380702, -0.421053, -0.438596, -0.45614, -0.466667, -0.477193, -0.487719, -0.498246, -0.507368, -0.516491, -0.525614, -0.534737, -0.54386, -0.552982, -0.562105, -0.571228, -0.580351, -0.589474, -0.602729, -0.615984, -0.62924, 0.291228, 0.354386, 0.378947, 0.385965, 0.385965, 0.385965, 0.368421, 0.350877, 0.330994, 0.311111, 0.291228, 0.271345, 0.251462, 0.231579, 0.211696, 0.191813, 0.17193, 0.153216, 0.134503, 0.115789, 0.097076, 0.078363, 0.059649, 0.040936, 0.022222, 0.003509, -0.01203, -0.027569, -0.043108, -0.058647, -0.074185, -0.089724, -0.105263, -0.114035, -0.122807, 0.557895, 0.673684, 0.674561, 0.675439, 0.676316, 0.677193, 0.659649, 0.642105, 0.624561, 0.607018, 0.589474, 0.57193, 0.554386, 0.536842, 0.519298, 0.501754, 0.484211, 0.466667, 0.449123, 0.429825, 0.410526, 0.391228, 0.37193, 0.352632, 0.333333, 0.314035, 0.294737, 0.275439, 0.25614, 0.243275, 0.230409, 0.217544, 0.204678, 0.191813, 0.178947, 0.180702, 0.182456, 0.184211, 0.185965, 0.212866, 0.239766, 0.266667, 0.293567, 0.320468, 0.347368, 0.374269, 0.40117, 0.42807, 0.449123, 0.470175, 0.491228, 0.512281, 0.533333, 0.554386, 0.575439, 0.596491, 0.617544, 0.638596, 0.659649, 0.680702, 0.689952, 0.699203, 0.708453, 0.717703, 0.726954, 0.736204, 0.745455, 0.754705, 0.763955, 0.773206, 0.782456, 0.767251, 0.752047, 0.736842, 0.721637, 0.706433, 0.691228, 0.676023, 0.660819, 0.645614, 0.630409, 0.615205, 0.6, 0.584795, 0.569591, 0.554386, 0.539181, 0.523977, 0.508772, 0.493567, 0.478363, 0.463158, 0.432895, 0.402632, 0.372368, 256, "obj-13", "multislider", "recall_preset", 251, 0.342105, 0.311842, 0.281579, 0.251316, 0.221053, 0.181053, 0.141053, 0.101053, 0.061053, 0.021053, -0.015789, -0.052632, -0.089474, -0.126316, -0.785965, -0.82807, -0.838158, -0.848246, -0.858333, -0.868421, -0.878509, -0.888596, -0.898684, -0.908772, -0.91886, -0.928947, -0.939035, -0.949123, -0.959211, -0.969298, -0.979386, -0.989474, -0.992982, -0.996491, -1.0, -1.0, -1.0, -0.985263, -0.970526, -0.955789, -0.941053, -0.926316, -0.897953, -0.869591, -0.841228, -0.812865, -0.784503, -0.75614, -0.727778, -0.699415, -0.671053, -0.64269, -0.614327, -0.585965, -0.557069, -0.528173, -0.499278, -0.470382, -0.441486, -0.41259, -0.383695, -0.354799, -0.325903, -0.297007, -0.268111, -0.239216, -0.21032, -0.181424, -0.152528, -0.123633, -0.094737, -0.069396, -0.044055, -0.018713, 0.006628, 0.031969, 0.05731, 0.082651, 0.107992, 0.133333, 0.158674, 0.184016, 0.209357, 0.234698, 0.260039, 0.28538, 0.310721, 0.336062, 0.361403, 0.382456, 0.403509, 0.424561, 0.445614, 0.466667, 0.487719, 0.508772, 0.529825, 0.550877, 0.570175, 0.589474, 0.590643, 0.591813, 0.592982, 0.595215, 0.597448, 0.599681, 0.601914, 0.604147, 0.60638, 0.608612, 0.610845, 0.613078, 0.615311, 0.617544, 0.621303, 0.625063, 0.628822, 0.632581, 0.636341, 0.6401, 0.64386, 0.647619, 0.651378, 0.655138, 0.658897, 0.662657, 0.666416, 0.670175, 0.673904, 0.677632, 0.68136, 0.685088, 0.688816, 0.692544, 0.696272, 0.7, 0.703728, 0.707456, 0.711184, 0.714912, 0.71864, 0.722368, 0.726097, 0.729825, 0.732376, 0.734928, 0.73748, 0.740032, 0.742584, 0.745136, 0.747687, 0.750239, 0.752791, 0.755343, 0.757895, 0.758852, 0.759809, 0.760766, 0.761723, 0.762679, 0.763636, 0.764593, 0.76555, 0.766507, 0.767464, 0.768421, 0.768421, 0.768421, 0.768421, 0.768421, 0.764035, 0.759649, 0.755263, 0.750877, 0.743275, 0.735673, 0.72807, 0.720468, 0.712865, 0.705263, 0.691228, 0.687719, 0.684211, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.677193, 0.691228, 0.691228, 0.689474, 0.687719, 0.681203, 0.674687, 0.66817, 0.661654, 0.655138, 0.648622, 0.642105, 0.634035, 0.625965, 0.617895, 0.609825, 0.601754, 0.593684, 0.585614, 0.577544, 0.569474, 0.561404, 0.548148, 0.534893, 0.521637, 0.508382, 0.495127, 0.481871, 0.468616, 0.455361, 0.442105, 0.422222, 0.402339, 0.382456, 0.362573, 0.34269, 0.322807, 0.301053, 0.279298, 0.257544, 0.235789, 0.214035, 0.17193, 0.129825, 0.05614, -0.049123, -0.059649, -0.049123, -0.038596, -0.014035, -0.003509, 0.0, 0.003509, 15, "obj-13", "multislider", "recall_preset", 502, 0.007018, 0.007018, 0.007018, 0.003509, -0.007018, -0.010526, -0.014035, -0.014035, -0.014035, -0.010526, 4, "obj-13", "multislider", "recall_preset" ]
										}
 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 12.0, 34.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 215.0, 38.0, 128.0, 22.0 ],
									"style" : "",
									"text" : "setmin 1., setmax 128"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 221.0, 64.0, 141.0, 22.0 ],
									"style" : "",
									"text" : "setmin 1, setmax 16348,"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 12.0, 32.5, 22.0 ],
									"style" : "",
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 38.0, 135.0, 22.0 ],
									"style" : "",
									"text" : "setmin -1., setmax 1., 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 64.0, 135.0, 22.0 ],
									"style" : "",
									"text" : "setmin 1, setmax 1024,"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 74.0, 735.0, 62.0, 22.0 ],
									"style" : "",
									"text" : "s out_osc"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 709.0, 101.0, 22.0 ],
									"style" : "",
									"text" : "prepend /shape9"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-13",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 78.0, 111.0, 1043.0, 570.0 ],
									"setstyle" : 1,
									"signed" : 1,
									"size" : 512,
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1056.0, 395.0, 47.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p extra"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1029.0, 38.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1., setmax 128"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1035.0, 64.0, 141.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 16348,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 12.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 38.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 64.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 1024,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 888.0, 373.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 347.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape4"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-42",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 888.0, 82.0, 278.0, 249.0 ],
					"setminmax" : [ 1.0, 128.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 128,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 746.0, 38.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1., setmax 128"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 752.0, 64.0, 141.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 16348,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 12.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 38.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 64.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 1024,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 605.0, 373.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 347.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape3"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-21",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 605.0, 93.0, 278.0, 249.0 ],
					"setminmax" : [ 1.0, 1024.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 128,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 456.0, 38.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1., setmax 128"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 462.0, 64.0, 141.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 16348,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 405.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 431.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 457.0, 138.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 128, 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 888.0, 766.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 888.0, 740.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape8"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-65",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 888.0, 485.0, 278.0, 249.0 ],
					"setminmax" : [ 1.0, 1024.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 405.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 431.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 457.0, 138.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 128, 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 605.0, 766.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 605.0, 740.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape7"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-58",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 605.0, 485.0, 278.0, 249.0 ],
					"setminmax" : [ 1.0, 1024.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 405.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 431.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 457.0, 138.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 128, 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 766.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 740.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape6"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-50",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 315.0, 485.0, 278.0, 249.0 ],
					"setminmax" : [ 1.0, 128.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 405.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 431.0, 122.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 457.0, 131.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1., setmax 128."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 766.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 740.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape5"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-16",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 27.0, 485.0, 278.0, 249.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 16,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1039.25, 48.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "udpsend localhost 5555"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 12.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 38.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 64.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 1024,"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 315.0, 373.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 347.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape2"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-35",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 315.0, 93.0, 278.0, 249.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 128,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 12.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 38.0, 135.0, 22.0 ],
					"style" : "",
					"text" : "setmin -1., setmax 1., 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 64.0, 145.0, 22.0 ],
					"style" : "",
					"text" : "setmin 1, setmax 1024, 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1039.25, 19.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "r out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 373.0, 62.0, 22.0 ],
					"style" : "",
					"text" : "s out_osc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 347.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "prepend /shape1"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-13",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 27.0, 82.0, 278.0, 249.0 ],
					"setstyle" : 1,
					"signed" : 1,
					"size" : 128,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
