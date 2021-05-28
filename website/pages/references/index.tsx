import { GetStaticPropsResult } from 'next'
import { getSortedReferencesData } from '../../src/lib/references'

import React, { ReactElement } from 'react'
// import TopicsDisplay from '../../src/components/TopicsDisplay'
import { Grid } from '@material-ui/core'
import Box from '@material-ui/core/Box'
import { ReferenceData } from '../../src/types/references'
import { PreviewReference } from '../../src/components/PreviewReference'
import { PageHeading } from '../../src/components/PageHeading'
import Head from 'next/head'

const Topics = ({ referencesData }: {  referencesData: ReferenceData[] }): ReactElement => {
  return (
    <>
      <Head>
        <title>wehoop Function Reference</title>
        {/* <meta name="description" content={'Tech topics like ' + topics.slice(0, 5).join(', ') + ' and more'} /> */}
      </Head>
      <PageHeading title="wehoop Function Reference" />
      {/* <TopicsDisplay topics={topics} n={1000} /> */}
      <Box pt={12} pb={4}>
        <Grid item xs={12}>
          <PreviewReference references={referencesData} />
        </Grid>
      </Box>
    </>
  )
}

export const getStaticProps = async (): Promise<
  GetStaticPropsResult<{
    topics: string[]
    referencesData: ReferenceData[]
  }>
> => {
  const sortedTopics = ['']
  const referencesData = getSortedReferencesData()

  return {
    props: {
      topics: sortedTopics,
      referencesData: referencesData.filter((pd) => pd.featured),
    },
  }
}

export default Topics
