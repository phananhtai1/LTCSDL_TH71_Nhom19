﻿using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.Common.Req
{
    public class SearchKyNangReq
    {
        public int Page { get; set; }

        public int Size { get; set; }

        public string KeyWord { get; set; }
    }
}
