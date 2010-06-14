/**
 * @file test_DomainSpanIterator.cpp
 * @author David Coeurjolly (\c david.coeurjolly@liris.cnrs.fr )
 *
 *
 * @date 2010/05/30
 *
 * This file is part of the DGtal library
 */

/**
 * Description of test_DomainSpanIterator <p>
 * Aim: simple test of \ref LineDomain
 */

#include <cstdio>
#include <cmath>
#include <iostream>
#include <fstream>
#include <algorithm>

#include "DGtal/base/Common.h"
#include "DGtal/kernel/Space.h"
#include "DGtal/kernel/domains/HyperRectDomain.h"


using namespace DGtal;
using namespace std;


/**
* Simple test of Span iterators on a 4D digital domain
*
**/
bool testIterator()
{

    trace.emphase() << "Iterator 4d: ";
    typedef Space<int,4> SpaceType4D;
    typedef SpaceType4D::TPoint TPoint4D;
    const int t4D[ ] = { 1, 1,1,1};
    const int t4D2[ ] = { 3,6,3,3};
    const int t4D3[ ] = { 1, 2,1,1};
    TPoint4D a4D ( t4D );
    TPoint4D b4D ( t4D2 );
    TPoint4D c4D ( t4D3 );

    trace.beginBlock("Span Domain iterator test");
    ///Domain construction
    HyperRectDomain<SpaceType4D> mySpan ( a4D,b4D );


    trace.emphase() << mySpan <<std::endl;

    ///iterates from  {1, 2,1,1} to { 3,6,3,3} along the dimension 1
    for ( HyperRectDomain<SpaceType4D>::ConstSpanIterator it = mySpan.span_begin ( c4D , 1);
            it != mySpan.span_end ( 1 );
            ++it )
        trace.info() << ( *it ) << std::endl;

    trace.endBlock();
    return mySpan.isValid();
}


int main()
{

    if ( testIterator() )
        return 0;
    else
        return 1;
}


