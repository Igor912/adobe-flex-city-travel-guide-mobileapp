package com.tourism_in_lviv.air.services
{
	public class ServiceUrl
	{
		private var _baseUrl:String;
		private var fullUrl:String;
		private var _parameters:String;

		public function ServiceUrl( base:String, dynamicPaths:Vector.<String> = null, parameters:Vector.<UrlParameter> = null, cacheBust:Boolean = true )
		{
			createUrl( base, dynamicPaths, parameters, cacheBust );
		}

		public function get baseUrl():String
		{
			return _baseUrl;
		}

		public function get parameters():String
		{
			return _parameters;
		}

		public function toString():String
		{
			return fullUrl;
		}

		private function createUrl( base:String, dynamicPaths:Vector.<String>, parameters:Vector.<UrlParameter>, cacheBust:Boolean ):void
		{
			var index:uint;
			var dynamicUrlPart:String = "";
			_parameters = "";

			if ( dynamicPaths && dynamicPaths.length > 0 )
			{
				for ( index = 0; index < dynamicPaths.length; index++ )
				{
					dynamicUrlPart += dynamicPaths[ index ];

					if ( index < dynamicPaths.length - 1 )
						dynamicUrlPart += "/";
				}
			}

			_baseUrl = base + dynamicUrlPart;

			if ( parameters && parameters.length > 0 )
			{
				dynamicUrlPart += "?";

				for ( index = 0; index < parameters.length; index++ )
				{
					_parameters += parameters[ index ].toString();

					if ( index < parameters.length - 1 )
						_parameters += "&";
				}

				dynamicUrlPart += _parameters;
			}

			if ( cacheBust )
			{
				dynamicUrlPart += parameters == null ? '?' : '&';
				dynamicUrlPart += Math.random().toString();
			}

			fullUrl = base + dynamicUrlPart;
		}
	}
}
