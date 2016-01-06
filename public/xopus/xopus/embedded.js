/* @SDL Live Content Create - 5.3 */
(function() {
	'use strict';

	// // Pollyfill for Array.forEach
	// Production steps of ECMA-262, Edition 5, 15.4.4.18
	// Reference: http://es5.github.com/#x15.4.4.18
	if (!Array.prototype.forEach) {
		Array.prototype.forEach = function(callback, thisArg) {

			var T, k;

			if (this == null) {
				throw new TypeError(" this is null or not defined");
			}

			// 1. Let O be the result of calling ToObject passing the |this| value as the argument.
			var O = Object(this);

			// 2. Let lenValue be the result of calling the Get internal method of O with the argument "length".
			// 3. Let len be ToUint32(lenValue).
			var len = O.length >>> 0;

			// 4. If IsCallable(callback) is false, throw a TypeError exception.
			// See: http://es5.github.com/#x9.11
			if (typeof callback !== "function") {
				throw new TypeError(callback + " is not a function");
			}

			// 5. If thisArg was supplied, let T be thisArg; else let T be undefined.
			if (arguments.length > 1) {
				T = thisArg;
			}

			// 6. Let k be 0
			k = 0;

			// 7. Repeat, while k < len
			while (k < len) {

				var kValue;

				// a. Let Pk be ToString(k).
				//   This is implicit for LHS operands of the in operator
				// b. Let kPresent be the result of calling the HasProperty internal method of O with argument Pk.
				//   This step can be combined with c
				// c. If kPresent is true, then
				if (k in O) {

					// i. Let kValue be the result of calling the Get internal method of O with argument Pk.
					kValue = O[k];

					// ii. Call the Call internal method of callback with T as the this value and
					// argument list containing kValue, k, and O.
					callback.call(T, kValue, k, O);
				}
				// d. Increase k by 1.
				k++;
			}
			// 8. return undefined
		};
	}

	// Pollyfill for Object.keys
	// From https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys
	if (!Object.keys) {
		Object.keys = (function() {
			'use strict';
			var hasOwnProperty = Object.prototype.hasOwnProperty,
				hasDontEnumBug = !({
					toString: null
				}).propertyIsEnumerable('toString'),
				dontEnums = ['toString', 'toLocaleString', 'valueOf', 'hasOwnProperty', 'isPrototypeOf', 'propertyIsEnumerable', 'constructor'],
				dontEnumsLength = dontEnums.length;

			return function(obj) {
				if (typeof obj !== 'object' && (typeof obj !== 'function' || obj === null)) {
					throw new TypeError('Object.keys called on non-object');
				}

				var result = [],
					prop, i;

				for (prop in obj) {
					if (hasOwnProperty.call(obj, prop)) {
						result.push(prop);
					}
				}

				if (hasDontEnumBug) {
					for (i = 0; i < dontEnumsLength; i++) {
						if (hasOwnProperty.call(obj, dontEnums[i])) {
							result.push(dontEnums[i]);
						}
					}
				}
				return result;
			};
		}());
	}
}());
"use strict";if(!('console' in window)){console={log:function(){console.A.push(arguments)},A:[],warn:function(B){console.log.apply(null,arguments)},error:function(){console.warn.apply(null,arguments)},assert:function(C,B){if(!C)throw new Error("Assertion failed: "+B)}}};Function.prototype.D=function(F,prefix){for(var G in F.prototype){if(this.prototype[G]){if(/Phase$/.test(G)){console.warn("Overriding "+prefix+"."+G+" () in ",this);}this.prototype[prefix+"$"+G]=F.prototype[G];}else{this.prototype[G]=F.prototype[G];}}if(F.prototype.hasOwnProperty("toString")){if(this.prototype.hasOwnProperty("toString")){this.prototype[prefix+"$toString"]=F.prototype.toString;}else{this.prototype.toString=F.prototype.toString;}}};function H(I){for(var J in I)return J;};(function(){return function M(N,O){for(var P in O){if(!N[P])N[P]=O[P];else M(N[P],O[P]);}}})()(this,{Q:{R:{S:{lang:{log:{}}},İ:{Ø:{}}}}});if(typeof Q.R.S.lang.log.Ĳ=='undefined'){Q.R.S.lang.log.Ĳ=(function(){var Ĳ;Ĳ=function Ĳ(){};Ĳ.prototype.Ĳ=Ĳ;var ĳ=function ĳ(Ĵ,ĵ){return Ĵ+'.'+ĵ+':';};Ĳ.Ķ=function Ķ(message){var ķ='Assertion failed: ';if(typeof message==='string'){message=ķ+message;}else{message.unshift(ķ);}return message;};Ĳ.log=function log(message,Ĵ,ĵ){console.log(ĳ(Ĵ,ĵ),message);};Ĳ.info=function info(message,Ĵ,ĵ){console.info(ĳ(Ĵ,ĵ),message);};Ĳ.warn=function warn(message,Ĵ,ĵ){console.warn(ĳ(Ĵ,ĵ),message);};Ĳ.error=function error(message,Ĵ,ĵ){console.error(ĳ(Ĵ,ĵ),message);};Ĳ.debug=function debug(message,Ĵ,ĵ){console.debug(ĳ(Ĵ,ĵ),message);};Ĳ.trace=function trace(message,Ĵ,ĵ){console.trace(ĳ(Ĵ,ĵ),message);};Ĳ.assert=function assert(message,Ĵ,ĵ){this.error(this.Ķ(message),Ĵ,ĵ);};return Ĳ;})();}if(typeof Q.R.S.lang.log.ĸ=='undefined'){Q.R.S.lang.log.ĸ=(function(){var ĸ;var Ĳ=Q.R.S.lang.log.Ĳ;ĸ=function ĸ(){};ĸ.prototype.ĸ=ĸ;ĸ.log=function log(message,Ĵ,ĵ){console.log.apply(console,[ĸ.Ĺ,ĸ.ĺ.Ļ,Ĵ,ĸ.ĺ.ļ,ĵ].concat(message));};ĸ.info=function info(message,Ĵ,ĵ){this.log(message,Ĵ,ĵ);};ĸ.debug=function debug(message,Ĵ,ĵ){console.debug.apply(console,[ĸ.Ĺ,ĸ.ĺ.Ľ,Ĵ,ĸ.ĺ.ľ,ĵ].concat(message));};ĸ.trace=function trace(message,Ĵ,ĵ){console.debug.apply(console,[ĸ.Ĺ,ĸ.ĺ.Ľ,Ĵ,ĸ.ĺ.ľ,ĵ].concat(message));};ĸ.warn=function warn(message,Ĵ,ĵ){console.warn.apply(console,[ĸ.Ĺ,ĸ.ĺ.Ŀ,Ĵ,ĸ.ĺ.ŀ,ĵ].concat(message));};ĸ.error=function error(message,Ĵ,ĵ){console.error.apply(console,[ĸ.Ĺ,ĸ.ĺ.Ł,Ĵ,ĸ.ĺ.ł,ĵ].concat(message));};ĸ.assert=function assert(message,Ĵ,ĵ){this.error(Ĳ.Ķ(message),Ĵ,ĵ);};ĸ.Ĺ="%c%s.%c%s:";ĸ.prototype.Ĺ="%c%s.%c%s:";ĸ.ĺ={Ļ:"color: lightgrey;",Ŀ:"color: grey; background: khaki",Ł:"color: tomato;",Ľ:"color: #e6e6e6;",ļ:"color:grey; font-size:0.9em;",ŀ:"color:black; background: khaki; font-size:0.9em;",ł:"color:red; font-size:0.9em;",ľ:"color:#e19d1e; font-size:0.9em;"};ĸ.prototype.ĺ={Ļ:"color: lightgrey;",Ŀ:"color: grey; background: khaki",Ł:"color: tomato;",Ľ:"color: #e6e6e6;",ļ:"color:grey; font-size:0.9em;",ŀ:"color:black; background: khaki; font-size:0.9em;",ł:"color:red; font-size:0.9em;",ľ:"color:#e19d1e; font-size:0.9em;"};return ĸ;})();}if(typeof Q.R.S.lang.log.Ń=='undefined'){Q.R.S.lang.log.Ń=(function(){var Ń;var ĸ=Q.R.S.lang.log.ĸ;var Ĳ=Q.R.S.lang.log.Ĳ;Ń=function Ń(name){var ń=name.split('.');this.method=ń[ń.length-1];this.Ņ=ń[ń.length-2];if(typeof Ń.ņ[name]==='undefined'){this.name=name;this.ņ=[];Ń.ņ[name]=this;Ń.Ň=null;for(var P in Ń.ň){this.ņ.push(Ń.ň[P]);}}else{throw new Error("logger with name '"+name+"' already exists");}};Ń.prototype.Ń=Ń;Ń.ŉ=function ŉ(Ŋ){for(var ŋ in Ń.Ō){ŋ&Ŋ?ō(ŋ):Ŏ(ŋ);}};Ń.ŏ=function ŏ(filter){Ń.Ň=filter?{}:null;var Ő=true;if(filter){if(typeof filter==='string'&&filter[0]==='!'){filter=filter.substr(1);Ő=false;}Object.keys(Ń.ņ).filter(typeof filter==='string'?function(Ĵ){return Ĵ.indexOf(filter)!==-1===Ő;}:function(Ĵ){return filter.test(Ĵ);}).forEach(function(key){Ń.Ň[key]=true;});}return Ń.Ň;};Ń.ő=function ő(Ņ){return Ń.Ň&&!(Ņ in Ń.Ň);};Ń.prototype.ő=function ő(){return Ń.ő(this.name);};Ń.prototype.Œ=function Œ(œ){return œ.length===1?œ[0]:Array.prototype.slice.call(œ);};Ń.Ŕ=function Ŕ(name,ň){Ń.ň[name]=ň;};Ń.prototype.trace=function trace(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].trace(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.debug=function debug(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].debug(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.info=function info(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].info(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.log=function log(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].log(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.warn=function warn(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].warn(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.error=function error(B){if(this.ő()){return false;}for(var P=0;P<this.ņ.length;++P){this.ņ[P].error(this.Œ(arguments),this.Ņ,this.method);}};Ń.prototype.assert=function assert(exp){if(this.ő()){return false;}if(!exp){for(var P=0;P<this.ņ.length;++P){Array.prototype.shift.call(arguments);this.ņ[P].assert(this.Œ(arguments),this.Ņ,this.method);}}};var ŕ=function ŕ(ŋ){var Methods={};Ń.Ō[ŋ].forEach(function(ĵ){Methods[ĵ]=Ń.prototype[ĵ];});return Methods;};var Ŏ=function Ŏ(ŋ){Ń.Ō[ŋ].forEach(function(ĵ){Ń.prototype[ĵ]=empty;});};var ō=function ō(ŋ){Ń.Ō[ŋ].forEach(function(ĵ){Ń.prototype[ĵ]=Ń.Ŗ[ŋ][ĵ];});};var ŗ=function ŗ(){Ń.Ŗ={};Object.keys(Ń.Ō).forEach(function(ŋ){Ń.Ŗ[ŋ]=ŕ(ŋ);});};var empty=function empty(){};var Ř=function Ř(){var ř=('isCrypted' in{Ś:true});var match=/debug=(true|false)/.exec(window.location.search);if(match&&match[1]){ř=match[1]==='true';}return ř;};Ń.ś={Ŝ:0,ŝ:1,Ş:2,ş:4,Š:8,š:16,Ţ:31};Ń.prototype.ś={Ŝ:0,ŝ:1,Ş:2,ş:4,Š:8,š:16,Ţ:31};Ń.Ō={"1":["error"],"2":["assert"],"4":["warn"],"8":["info","log"],"16":["trace","debug"]};Ń.prototype.Ō={"1":["error"],"2":["assert"],"4":["warn"],"8":["info","log"],"16":["trace","debug"]};(function(){Ń.ň={};Ń.ņ={};Ń.Ŕ('StyledConsole','ActiveXObject' in window?Ĳ:ĸ);ŗ();Ń.ŉ(Ř()?Ń.ś.ŝ+Ń.ś.Š+Ń.ś.ş+Ń.ś.Ş:Ń.ś.Ŝ);})();return Ń;})();}if(typeof Q.R.İ.Ø.ђG=='undefined'){Q.R.İ.Ø.ђG=(function(){var ђG;var Ń=Q.R.S.lang.log.Ń;ђG=function ђG(){this.Ø=null;this.map={};this.ʖA={};};ђG.prototype.ђG=ђG;ђG.prototype["registerAPI"]=function(){return this.ѓG.apply(this,arguments);};ђG.prototype.ѓG=function ѓG(Ø,name){this.map[name]=Ø;this.єG(Ø,name);};ђG.prototype["getAPI"]=function(){return this.ǂB.apply(this,arguments);};ђG.prototype.ǂB=function ǂB(name){return this.map[name]||null;};ђG.prototype.єG=function єG(Ø,name){var ʖA=[];if(this.ʖA[undefined]){ʖA=ʖA.concat(this.ʖA[undefined]);}if(this.ʖA[name]){ʖA=ʖA.concat(this.ʖA[name]);}for(var բA,P=0,ƃ=ʖA.length;P<ƃ;P++){բA=ʖA[P];if(typeof բA==='function'){բA(Ø,name);}else if(բA!==null&&typeof բA==='object'&&typeof բA.ѕG==='function'){բA.ѕG(Ø,name);}}};ђG.prototype["addListener"]=function(){return this.ژ.apply(this,arguments);};ђG.prototype.ژ=function ژ(բA,name){if(!this.ʖA[name]){this.ʖA[name]=[];}this.ʖA[name].push(բA);};ђG.prototype["removeListener"]=function(){return this.ՔA.apply(this,arguments);};ђG.prototype.ՔA=function ՔA(բA,name){if(!this.ʖA[name]){return;}for(var P=this.ʖA[name].length;P--;){if(this.ʖA[name][P]===բA){this.ʖA[name].splice(P,1);}}};(function(){window['EmbeddedXopus']=new ђG();})();return ђG;})();}